import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_gpskin/ui/widgets/widgets.dart';

class FindDevice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FindDeviceState();
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class FindDeviceState extends State<FindDevice> {


  @override
  void initState() {
    super.initState();
    _scanDevice();
  }

  void _scanDevice() {
    FlutterBlue.instance.scan(timeout: Duration(hours: 2),).listen((scanResult) {
      print('localName: ${scanResult.advertisementData.localName}');
      if (scanResult.advertisementData.localName == "SkinBarrie") {
        FlutterBlue.instance.stopScan();
        scanResult.device.connect();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          scanResult.device.connect();
          return DeviceScreen(device: scanResult.device);
        }));
        print('Device state: ${scanResult.device.services.toList()}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.lightBlue,
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return FindDevicesScreen();
            }
            return BluetoothOffScreen(state: state);
          }),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key key, this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              'Bluetooth Adapter is ${state != null ? state.toString().substring(15) : 'not available'}.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .subhead
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class FindDevicesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Devices'),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<List<BluetoothDevice>>(
                stream: Stream.periodic(Duration(seconds: 2))
                    .asyncMap((_) => FlutterBlue.instance.connectedDevices),
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data
                      .map((d) => ListTile(
                    title: Text(d.name),
                    subtitle: Text(d.id.toString()),
                    trailing: StreamBuilder<BluetoothDeviceState>(
                      stream: d.state,
                      initialData: BluetoothDeviceState.disconnected,
                      builder: (c, snapshot) {
                        if (snapshot.data ==
                            BluetoothDeviceState.connected) {
                          return RaisedButton(
                            child: Text('OPEN'),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeviceScreen(device: d))),
                          );
                        }
                        return Text(snapshot.data.toString());
                      },
                    ),
                  )).toList(),
                ),
              ),
              StreamBuilder<List<ScanResult>>(
                stream: FlutterBlue.instance.scanResults,
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data
                      .map(
                        (r) => ScanResultTile(
                      result: r,
                      onTap: () => Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        r.device.connect();
                        return DeviceScreen(device: r.device);
                      })),
                    ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data) {
            return FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: () => FlutterBlue.instance.stopScan(),
              backgroundColor: Colors.red,
            );
          } else {
            return FloatingActionButton(
                child: Icon(Icons.search),
                onPressed: () => FlutterBlue.instance
                    .startScan(timeout: Duration(seconds: 4)));
          }
        },
      ),
    );
  }
}

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key key, this.device}) : super(key: key);

  final BluetoothDevice device;

  List<Widget> _buildServiceTiles(List<BluetoothService> services) {
    return services
        .map(
          (s) => ServiceTile(
        service: s,
        characteristicTiles: s.characteristics
            .map(
              (c) => CharacteristicTile(
            characteristic: c,
            onReadPressed: () => c.read(),
            onWritePressed: () => c.write([0x11]),
            onNotificationPressed: () =>
                c.setNotifyValue(!c.isNotifying),
            descriptorTiles: c.descriptors
                .map(
                  (d) => DescriptorTile(
                descriptor: d,
                onReadPressed: () => d.read(),
                onWritePressed: () => d.write([0x50]),
              ),
            )
                .toList(),
          ),
        )
            .toList(),
      ),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
        actions: <Widget>[
          StreamBuilder<BluetoothDeviceState>(
            stream: device.state,
            initialData: BluetoothDeviceState.connecting,
            builder: (c, snapshot) {
              VoidCallback onPressed;
              String text;
              switch (snapshot.data) {
                case BluetoothDeviceState.connected:
                  onPressed = () => device.disconnect();
                  text = 'DISCONNECT';
                  break;
                case BluetoothDeviceState.disconnected:
                  onPressed = () => device.connect();
                  text = 'CONNECT';
                  break;
                default:
                  onPressed = null;
                  text = snapshot.data.toString().substring(21).toUpperCase();
                  break;
              }
              return FlatButton(
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .button
                        .copyWith(color: Colors.white),
                  ));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<BluetoothDeviceState>(
              stream: device.state,
              initialData: BluetoothDeviceState.connecting,
              builder: (c, snapshot) => ListTile(
                leading: (snapshot.data == BluetoothDeviceState.connected)
                    ? Icon(Icons.bluetooth_connected)
                    : Icon(Icons.bluetooth_disabled),
                title: Text(
                    'Device is ${snapshot.data.toString().split('.')[1]}.'),
                subtitle: Column(
                  children: <Widget>[
                    Text('${device.id}'),
                    Text('${""}'),
                  ],
                ),
                trailing: StreamBuilder<bool>(
                  stream: device.isDiscoveringServices,
                  initialData: false,
                  builder: (c, snapshot) => IndexedStack(
                    index: snapshot.data ? 1 : 0,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () => device.discoverServices(),
                      ),
                      IconButton(
                        icon: SizedBox(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.grey),
                          ),
                          width: 18.0,
                          height: 18.0,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
            ),
            StreamBuilder<int>(
              stream: device.mtu,
              initialData: 0,
              builder: (c, snapshot) => ListTile(
                title: Text('MTU Size'),
                subtitle: Text('${snapshot.data} bytes'),
                trailing: IconButton(
                  icon: Icon
                    (Icons.edit),
                  onPressed: () => device.requestMtu(223),
                ),
              ),
            ),
            StreamBuilder<List<BluetoothService>>(
              stream: device.services,
              initialData: [],
              builder: (c, snapshot) {
                return Column(
                  children: _buildServiceTiles(snapshot.data),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//import 'dart:convert';
//
//import 'package:flutter/material.dart';
//import 'package:flutter_blue/flutter_blue.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) => MaterialApp(
//    title: 'BLE Demo',
//    theme: ThemeData(
//      primarySwatch: Colors.blue,
//    ),
//    home: MyHomePage(title: 'Flutter BLE Demo'),
//  );
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//  final FlutterBlue flutterBlue = FlutterBlue.instance;
//  final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();
//  final Map<Guid, List<int>> readValues = new Map<Guid, List<int>>();
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  final _writeController = TextEditingController();
//  BluetoothDevice _connectedDevice;
//  List<BluetoothService> _services;
//
//  _addDeviceTolist(final BluetoothDevice device) {
//    if (!widget.devicesList.contains(device)) {
//      setState(() {
//        widget.devicesList.add(device);
//      });
//    }
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    widget.flutterBlue.connectedDevices
//        .asStream()
//        .listen((List<BluetoothDevice> devices) {
//      for (BluetoothDevice device in devices) {
//        _addDeviceTolist(device);
//      }
//    });
//    widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
//      for (ScanResult result in results) {
//        _addDeviceTolist(result.device);
//      }
//    });
//    widget.flutterBlue.startScan(timeout: Duration(hours: 2),);
//    if (widget.flutterBlue.isScanning != null){
//
//    }
//  }
//
//  ListView _buildListViewOfDevices() {
//    List<Container> containers = new List<Container>();
//    for (BluetoothDevice device in widget.devicesList) {
//      containers.add(
//        Container(
//          height: 50,
//          child: Row(
//            children: <Widget>[
//              Expanded(
//                child: Column(
//                  children: <Widget>[
//                    Text(device.name == '' ? '(unknown device)' : device.name),
//                    Text(device.id.toString()),
//                  ],
//                ),
//              ),
//              FlatButton(
//                color: Colors.blue,
//                child: Text(
//                  'Connect',
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () async {
//                  widget.flutterBlue.stopScan();
//                  try {
//                    await device.connect();
//                  } catch (e) {
//                    if (e.code != 'already_connected') {
//                      throw e;
//                    }
//                  } finally {
//                    _services = await device.discoverServices();
//                  }
//                  setState(() {
//                    _connectedDevice = device;
//                  });
//                },
//              ),
//            ],
//          ),
//        ),
//      );
//    }
//
//    return ListView(
//      padding: const EdgeInsets.all(8),
//      children: <Widget>[
//        ...containers,
//      ],
//    );
//  }
//
//  List<ButtonTheme> _buildReadWriteNotifyButton(
//      BluetoothCharacteristic characteristic) {
//    List<ButtonTheme> buttons = new List<ButtonTheme>();
//
//    if (characteristic.properties.read) {
//      buttons.add(
//        ButtonTheme(
//          minWidth: 10,
//          height: 20,
//          child: Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 4),
//            child: RaisedButton(
//              color: Colors.blue,
//              child: Text('READ', style: TextStyle(color: Colors.white)),
//              onPressed: () async {
//                var sub = characteristic.value.listen((value) {
//                  setState(() {
//                    widget.readValues[characteristic.uuid] = value;
//                  });
//                });
//                await characteristic.read();
//                sub.cancel();
//              },
//            ),
//          ),
//        ),
//      );
//    }
//    if (characteristic.properties.writeWithoutResponse) {
//      buttons.add(
//        ButtonTheme(
//          minWidth: 10,
//          height: 20,
//          child: Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 4),
//            child: RaisedButton(
//              child: Text('WRITE', style: TextStyle(color: Colors.white)),
//              onPressed: () async {
//                await showDialog(
//                    context: context,
//                    builder: (BuildContext context) {
//                      return AlertDialog(
//                        title: Text("Write"),
//                        content: Row(
//                          children: <Widget>[
//                            Expanded(
//                              child: TextField(
//                                controller: _writeController,
//                              ),
//                            ),
//                          ],
//                        ),
//                        actions: <Widget>[
//                          FlatButton(
//                            child: Text("Send"),
//                            onPressed: () {
//                              characteristic.write([0x11,0x50]);
//                              Navigator.pop(context);
//                            },
//                          ),
//                          FlatButton(
//                            child: Text("Cancel"),
//                            onPressed: () {
//                              Navigator.pop(context);
//                            },
//                          ),
//                        ],
//                      );
//                    });
//              },
//            ),
//          ),
//        ),
//      );
//    }
//    if (characteristic.properties.notify) {
//      buttons.add(
//        ButtonTheme(
//          minWidth: 10,
//          height: 20,
//          child: Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 4),
//            child: RaisedButton(
//              child: Text('NOTIFY', style: TextStyle(color: Colors.white)),
//              onPressed: () async {
//                characteristic.value.listen((value) {
//                  widget.readValues[characteristic.uuid] = value;
//                });
//                await characteristic.setNotifyValue(true);
//              },
//            ),
//          ),
//        ),
//      );
//    }
//
//    return buttons;
//  }
//
//  ListView _buildConnectDeviceView() {
//    List<Container> containers = new List<Container>();
//
//    for (BluetoothService service in _services) {
//      List<Widget> characteristicsWidget = new List<Widget>();
//
//      for (BluetoothCharacteristic characteristic in service.characteristics) {
//        characteristicsWidget.add(
//          Align(
//            alignment: Alignment.centerLeft,
//            child: Column(
//              children: <Widget>[
//                Row(
//                  children: <Widget>[
//                    Text(characteristic.uuid.toString(),
//                        style: TextStyle(fontWeight: FontWeight.bold)),
//                  ],
//                ),
//                Row(
//                  children: <Widget>[
//                    ..._buildReadWriteNotifyButton(characteristic),
//                  ],
//                ),
//                Row(
//                  children: <Widget>[
//                    Text('Value: ' +
//                        widget.readValues[characteristic.uuid].toString()),
//                  ],
//                ),
//                Divider(),
//              ],
//            ),
//          ),
//        );
//      }
//      containers.add(
//        Container(
//          child: ExpansionTile(
//              title: Text(service.uuid.toString()),
//              children: characteristicsWidget),
//        ),
//      );
//    }
//
//    return ListView(
//      padding: const EdgeInsets.all(8),
//      children: <Widget>[
//        ...containers,
//      ],
//    );
//  }
//
//  ListView _buildView() {
//    if (_connectedDevice != null) {
//      return _buildConnectDeviceView();
//    }
//    return _buildListViewOfDevices();
//  }
//
//  @override
//  Widget build(BuildContext context) => Scaffold(
//    appBar: AppBar(
//      title: Text(widget.title),
//    ),
//    body: _buildView(),
//  );
//}
