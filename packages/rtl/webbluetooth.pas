Unit webbluetooth;

{$IFDEF PAS2JS}
{$MODE ObjFPC}
{$H+}
{$modeswitch externalclass}
{$ENDIF}

interface

uses JS,web{$IFDEF DCC},types{$ENDIF};

Type
  // Forward class definitions
  TJSBluetooth = Class;
  TJSBluetoothPermissionResult = Class;
  TJSValueEvent = Class;
  TJSBluetoothDevice = Class;
  TJSBluetoothManufacturerDataMap = Class;
  TJSBluetoothServiceDataMap = Class;
  TJSBluetoothAdvertisingEvent = Class;
  TJSBluetoothRemoteGATTServer = Class;
  TJSBluetoothRemoteGATTService = Class;
  TJSBluetoothRemoteGATTCharacteristic = Class;
  TJSBluetoothCharacteristicProperties = Class;
  TJSBluetoothRemoteGATTDescriptor = Class;
  TJSCharacteristicEventHandlers = Class;
  TJSBluetoothDeviceEventHandlers = Class;
  TJSServiceEventHandlers = Class;
  TJSBluetoothUUID = Class;
  TJSBluetoothDataFilterInit = Class;
  TJSBluetoothLEScanFilterInit = Class;
  TJSRequestDeviceOptions = Class;
  TJSBluetoothPermissionDescriptor = Class;
  TJSAllowedBluetoothDevice = Class;
  TJSBluetoothPermissionData = Class;
  TJSValueEventInit = Class;
  TJSBluetoothAdvertisingEventInit = Class;
  UUID = String;
  // Union of DOMString, unsigned long
  BluetoothServiceUUID = JSValue; 
  // Union of DOMString, unsigned long
  BluetoothCharacteristicUUID = JSValue; 
  // Union of DOMString, unsigned long
  BluetoothDescriptorUUID = JSValue; 
  
  { --------------------------------------------------------------------
    TJSBluetoothDataFilterInit
    --------------------------------------------------------------------}
  
  TJSBluetoothDataFilterInit = class(TJSObject)
    dataPrefix : TJSBufferSource;
    mask : TJSBufferSource;
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothLEScanFilterInit
    --------------------------------------------------------------------}
  
  TBluetoothServiceUUIDDynArray = Array of BluetoothServiceUUID;
  TJSBluetoothLEScanFilterInit = class(TJSObject)
    services : TBluetoothServiceUUIDDynArray;
    name : String;
    namePrefix : String;
    manufacturerData : TJSObject;
    serviceData : TJSObject;
  end;
  
  { --------------------------------------------------------------------
    TJSRequestDeviceOptions
    --------------------------------------------------------------------}
  
  TTJSBluetoothLEScanFilterInitDynArray = Array of TJSBluetoothLEScanFilterInit;
  TJSRequestDeviceOptions = class(TJSObject)
    filters : TTJSBluetoothLEScanFilterInitDynArray;
    optionalServices : TBluetoothServiceUUIDDynArray;
    acceptAllDevices : boolean;
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothPermissionDescriptor
    --------------------------------------------------------------------}
  
  TJSBluetoothPermissionDescriptor = class(TJSObject)
    deviceId : String;
    filters : TTJSBluetoothLEScanFilterInitDynArray;
    optionalServices : TBluetoothServiceUUIDDynArray;
    acceptAllDevices : boolean;
  end;
  
  { --------------------------------------------------------------------
    TJSAllowedBluetoothDevice
    --------------------------------------------------------------------}
  
  TJSAllowedBluetoothDevice = class(TJSObject)
    deviceId : String;
    mayUseGATT : boolean;
    allowedServices : JSValue;
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothPermissionData
    --------------------------------------------------------------------}
  
  TTJSAllowedBluetoothDeviceDynArray = Array of TJSAllowedBluetoothDevice;
  TJSBluetoothPermissionData = class(TJSObject)
    allowedDevices : TTJSAllowedBluetoothDeviceDynArray;
  end;
  
  { --------------------------------------------------------------------
    TJSValueEventInit
    --------------------------------------------------------------------}
  
  TJSValueEventInit = class(TJSObject)
    value : JSValue;
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothAdvertisingEventInit
    --------------------------------------------------------------------}
  
  TJSValueDynArray = Array of JSValue;
  TJSBluetoothAdvertisingEventInit = class(TJSObject)
    device : TJSBluetoothDevice;
    uuids : TJSValueDynArray;
    name : String;
    appearance : Cardinal;
    txPower : byte;
    rssi : byte;
    manufacturerData : TJSObject;
    serviceData : TJSObject;
  end;
  
  { --------------------------------------------------------------------
    TJSBluetooth
    --------------------------------------------------------------------}
  
  TJSBluetooth = class {$IFDEF PAS2JS}external name 'Bluetooth'{$ENDIF} (TJSEventTarget)
  Private
    FreferringDevice : TJSBluetoothDevice; {$IFDEF PAS2JS}external name 'referringDevice';{$ENDIF}
  Public
    onavailabilitychanged : TJSEventHandler;
    function getAvailability: TJSPromise;
    function requestDevice(options : TJSRequestDeviceOptions): TJSPromise; overload;
    function requestDevice: TJSPromise; overload;
    Property referringDevice : TJSBluetoothDevice Read FreferringDevice; 
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothPermissionResult
    --------------------------------------------------------------------}
  
  TTJSBluetoothDeviceDynArray = Array of TJSBluetoothDevice;
  TJSBluetoothPermissionResult = class {$IFDEF PAS2JS}external name 'BluetoothPermissionResult'{$ENDIF} (TJSOBject)
  Private
  Public
    devices : TTJSBluetoothDeviceDynArray;
  end;
  
  { --------------------------------------------------------------------
    TJSValueEvent
    --------------------------------------------------------------------}
  
  TJSValueEvent = class {$IFDEF PAS2JS}external name 'ValueEvent'{$ENDIF} (TJSEvent)
  Private
    Fvalue : JSValue; {$IFDEF PAS2JS}external name 'value';{$ENDIF}
  Public
    Property value : JSValue Read Fvalue; 
  end;

  { --------------------------------------------------------------------
    TJSBluetoothDevice
    --------------------------------------------------------------------}
  
  TJSBluetoothDevice = class {$IFDEF PAS2JS}external name 'BluetoothDevice'{$ENDIF}
  Private
    Fid : String; {$IFDEF PAS2JS}external name 'id';{$ENDIF}
    Fname : String; {$IFDEF PAS2JS}external name 'name';{$ENDIF}
    Fgatt : TJSBluetoothRemoteGATTServer; {$IFDEF PAS2JS}external name 'gatt';{$ENDIF}
    FwatchingAdvertisements : boolean; {$IFDEF PAS2JS}external name 'watchingAdvertisements';{$ENDIF}
  Public
    function watchAdvertisements: TJSPromise;
    Procedure unwatchAdvertisements;
    Property id : String Read Fid; 
    Property name : String Read Fname;
    Property gatt : TJSBluetoothRemoteGATTServer Read Fgatt; 
    Property watchingAdvertisements : boolean Read FwatchingAdvertisements; 
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothManufacturerDataMap
    --------------------------------------------------------------------}
  
  TJSBluetoothManufacturerDataMap = class {$IFDEF PAS2JS}external name 'BluetoothManufacturerDataMap'{$ENDIF}
  Private
  Public
  end;

  { --------------------------------------------------------------------
    TJSBluetoothServiceDataMap
    --------------------------------------------------------------------}

  TJSBluetoothServiceDataMap = class {$IFDEF PAS2JS}external name 'BluetoothServiceDataMap'{$ENDIF}
  Private
  Public
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothAdvertisingEvent
    --------------------------------------------------------------------}
  
  TUUIDDynArray = Array of UUID;
  TJSBluetoothAdvertisingEvent = class {$IFDEF PAS2JS}external name 'BluetoothAdvertisingEvent'{$ENDIF} (TJSEvent)
  Private
    Fdevice : TJSBluetoothDevice; {$IFDEF PAS2JS}external name 'device';{$ENDIF}
    Fuuids : TUUIDDynArray; {$IFDEF PAS2JS}external name 'uuids';{$ENDIF}
    Fname : String; {$IFDEF PAS2JS}external name 'name';{$ENDIF}
    Fappearance : Cardinal; {$IFDEF PAS2JS}external name 'appearance';{$ENDIF}
    FtxPower : byte; {$IFDEF PAS2JS}external name 'txPower';{$ENDIF}
    Frssi : byte; {$IFDEF PAS2JS}external name 'rssi';{$ENDIF}
    FmanufacturerData : TJSBluetoothManufacturerDataMap; {$IFDEF PAS2JS}external name 'manufacturerData';{$ENDIF}
    FserviceData : TJSBluetoothServiceDataMap; {$IFDEF PAS2JS}external name 'serviceData';{$ENDIF}
  Public
    Property device : TJSBluetoothDevice Read Fdevice; 
    Property uuids : TUUIDDynArray Read Fuuids; 
    Property name : String Read Fname;
    Property appearance : Cardinal Read Fappearance; 
    Property txPower : byte Read FtxPower; 
    Property rssi : byte Read Frssi; 
    Property manufacturerData : TJSBluetoothManufacturerDataMap Read FmanufacturerData; 
    Property serviceData : TJSBluetoothServiceDataMap Read FserviceData; 
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothRemoteGATTServer
    --------------------------------------------------------------------}
  
  TJSBluetoothRemoteGATTServer = class {$IFDEF PAS2JS}external name 'BluetoothRemoteGATTServer'{$ENDIF}
  Private
    Fdevice : TJSBluetoothDevice; {$IFDEF PAS2JS}external name 'device';{$ENDIF}
    Fconnected : boolean; {$IFDEF PAS2JS}external name 'connected';{$ENDIF}
  Public
    function connect: TJSPromise;
    Procedure disconnect;
    function getPrimaryService(service : BluetoothServiceUUID): TJSPromise;
    function getPrimaryServices(service : BluetoothServiceUUID): TJSPromise; overload;
    function getPrimaryServices: TJSPromise; overload;
    Property device : TJSBluetoothDevice Read Fdevice; 
    Property connected : boolean Read Fconnected; 
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothRemoteGATTService
    --------------------------------------------------------------------}
  
  TJSBluetoothRemoteGATTService = class {$IFDEF PAS2JS}external name 'BluetoothRemoteGATTService'{$ENDIF}
  Private
    Fdevice : TJSBluetoothDevice; {$IFDEF PAS2JS}external name 'device';{$ENDIF}
    Fuuid : UUID; {$IFDEF PAS2JS}external name 'uuid';{$ENDIF}
    FisPrimary : boolean; {$IFDEF PAS2JS}external name 'isPrimary';{$ENDIF}
  Public
    function getCharacteristic(characteristic : BluetoothCharacteristicUUID): TJSPromise;
    function getCharacteristics(characteristic : BluetoothCharacteristicUUID): TJSPromise; overload;
    function getCharacteristics: TJSPromise; overload;
    function getIncludedService(service : BluetoothServiceUUID): TJSPromise;
    function getIncludedServices(service : BluetoothServiceUUID): TJSPromise; overload;
    function getIncludedServices: TJSPromise; overload;
    Property device : TJSBluetoothDevice Read Fdevice; 
    Property _uuid : UUID Read Fuuid; 
    Property isPrimary : boolean Read FisPrimary; 
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothRemoteGATTCharacteristic
    --------------------------------------------------------------------}
  
  TJSBluetoothRemoteGATTCharacteristic = class {$IFDEF PAS2JS}external name 'BluetoothRemoteGATTCharacteristic'{$ENDIF}
  Private
    Fservice : TJSBluetoothRemoteGATTService; {$IFDEF PAS2JS}external name 'service';{$ENDIF}
    Fuuid : UUID; {$IFDEF PAS2JS}external name 'uuid';{$ENDIF}
    Fproperties : TJSBluetoothCharacteristicProperties; {$IFDEF PAS2JS}external name 'properties';{$ENDIF}
    Fvalue : TJSDataView; {$IFDEF PAS2JS}external name 'value';{$ENDIF}
  Public
    function getDescriptor(descriptor : BluetoothDescriptorUUID): TJSPromise;
    function getDescriptors(descriptor : BluetoothDescriptorUUID): TJSPromise; overload;
    function getDescriptors: TJSPromise; overload;
    function readValue: TJSPromise;
    function writeValue(value : TJSBufferSource): TJSPromise;
    function startNotifications: TJSPromise;
    function stopNotifications: TJSPromise;
    Property service : TJSBluetoothRemoteGATTService Read Fservice; 
    Property _uuid : UUID Read Fuuid; 
    Property properties : TJSBluetoothCharacteristicProperties Read Fproperties; 
    Property value : TJSDataView Read Fvalue; 
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothCharacteristicProperties
    --------------------------------------------------------------------}
  
  TJSBluetoothCharacteristicProperties = class {$IFDEF PAS2JS}external name 'BluetoothCharacteristicProperties'{$ENDIF}
  Private
    Fbroadcast : boolean; {$IFDEF PAS2JS}external name 'broadcast';{$ENDIF}
    Fread : boolean; {$IFDEF PAS2JS}external name 'read';{$ENDIF}
    FwriteWithoutResponse : boolean; {$IFDEF PAS2JS}external name 'writeWithoutResponse';{$ENDIF}
    Fwrite : boolean; {$IFDEF PAS2JS}external name 'write';{$ENDIF}
    Fnotify : boolean; {$IFDEF PAS2JS}external name 'notify';{$ENDIF}
    Findicate : boolean; {$IFDEF PAS2JS}external name 'indicate';{$ENDIF}
    FauthenticatedSignedWrites : boolean; {$IFDEF PAS2JS}external name 'authenticatedSignedWrites';{$ENDIF}
    FreliableWrite : boolean; {$IFDEF PAS2JS}external name 'reliableWrite';{$ENDIF}
    FwritableAuxiliaries : boolean; {$IFDEF PAS2JS}external name 'writableAuxiliaries';{$ENDIF}
  Public
    Property broadcast : boolean Read Fbroadcast; 
    Property read : boolean Read Fread; 
    Property writeWithoutResponse : boolean Read FwriteWithoutResponse; 
    Property write : boolean Read Fwrite; 
    Property notify : boolean Read Fnotify; 
    Property indicate : boolean Read Findicate; 
    Property authenticatedSignedWrites : boolean Read FauthenticatedSignedWrites; 
    Property reliableWrite : boolean Read FreliableWrite; 
    Property writableAuxiliaries : boolean Read FwritableAuxiliaries; 
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothRemoteGATTDescriptor
    --------------------------------------------------------------------}
  
  TJSBluetoothRemoteGATTDescriptor = class {$IFDEF PAS2JS}external name 'BluetoothRemoteGATTDescriptor'{$ENDIF}
  Private
    Fcharacteristic : TJSBluetoothRemoteGATTCharacteristic; {$IFDEF PAS2JS}external name 'characteristic';{$ENDIF}
    Fuuid : UUID; {$IFDEF PAS2JS}external name 'uuid';{$ENDIF}
    Fvalue : TJSDataView; {$IFDEF PAS2JS}external name 'value';{$ENDIF}
  Public
    function readValue: TJSPromise;
    function writeValue(value : TJSBufferSource): TJSPromise;
    Property characteristic : TJSBluetoothRemoteGATTCharacteristic Read Fcharacteristic; 
    Property _uuid : UUID Read Fuuid; 
    Property value : TJSDataView Read Fvalue; 
  end;
  
  { --------------------------------------------------------------------
    TJSCharacteristicEventHandlers
    --------------------------------------------------------------------}
  
  TJSCharacteristicEventHandlers = class {$IFDEF PAS2JS}external name 'CharacteristicEventHandlers'{$ENDIF}
  Private
  Public
      oncharacteristicvaluechanged : TJSEventHandler;
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothDeviceEventHandlers
    --------------------------------------------------------------------}
  
  TJSBluetoothDeviceEventHandlers = class {$IFDEF PAS2JS}external name 'BluetoothDeviceEventHandlers'{$ENDIF}
  Private
  Public
      ongattserverdisconnected : TJSEventHandler;
  end;
  
  { --------------------------------------------------------------------
    TJSServiceEventHandlers
    --------------------------------------------------------------------}
  
  TJSServiceEventHandlers = class {$IFDEF PAS2JS}external name 'ServiceEventHandlers'{$ENDIF}
  Private
  Public
      onserviceadded : TJSEventHandler;
      onservicechanged : TJSEventHandler;
      onserviceremoved : TJSEventHandler;
  end;
  
  { --------------------------------------------------------------------
    TJSBluetoothUUID
    --------------------------------------------------------------------}
  
  TJSBluetoothUUID = class {$IFDEF PAS2JS}external name 'BluetoothUUID'{$ENDIF}
  Private
  Public
    function getService(name : JSValue): UUID;
    function getCharacteristic(name : JSValue): UUID;
    function getDescriptor(name : JSValue): UUID;
    function canonicalUUID(alias : NativeInt): UUID;
  end;
  
  { --------------------------------------------------------------------
    TJSNavigator
    --------------------------------------------------------------------}
  
  TJSNavigator = class {$IFDEF PAS2JS}external name 'Navigator'{$ENDIF}
  Private
    Fbluetooth : TJSBluetooth; {$IFDEF PAS2JS}external name 'bluetooth';{$ENDIF}
  Public
    Property bluetooth : TJSBluetooth Read Fbluetooth;
  end;

implementation

{$IFDEF DCC}
{ TJSBluetooth }

function TJSBluetooth.getAvailability: TJSPromise;
begin

end;

function TJSBluetooth.requestDevice(
  options: TJSRequestDeviceOptions): TJSPromise;
begin

end;

function TJSBluetooth.requestDevice: TJSPromise;
begin

end;

{ TJSBluetoothDevice }

procedure TJSBluetoothDevice.unwatchAdvertisements;
begin

end;

function TJSBluetoothDevice.watchAdvertisements: TJSPromise;
begin

end;

{ TJSBluetoothRemoteGATTServer }

function TJSBluetoothRemoteGATTServer.connect: TJSPromise;
begin

end;

procedure TJSBluetoothRemoteGATTServer.disconnect;
begin

end;

function TJSBluetoothRemoteGATTServer.getPrimaryService(
  service: BluetoothServiceUUID): TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTServer.getPrimaryServices(
  service: BluetoothServiceUUID): TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTServer.getPrimaryServices: TJSPromise;
begin

end;

{ TJSBluetoothRemoteGATTService }

function TJSBluetoothRemoteGATTService.getCharacteristic(
  characteristic: BluetoothCharacteristicUUID): TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTService.getCharacteristics: TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTService.getCharacteristics(
  characteristic: BluetoothCharacteristicUUID): TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTService.getIncludedService(
  service: BluetoothServiceUUID): TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTService.getIncludedServices(
  service: BluetoothServiceUUID): TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTService.getIncludedServices: TJSPromise;
begin

end;

{ TJSBluetoothRemoteGATTCharacteristic }

function TJSBluetoothRemoteGATTCharacteristic.getDescriptor(
  descriptor: BluetoothDescriptorUUID): TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTCharacteristic.getDescriptors(
  descriptor: BluetoothDescriptorUUID): TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTCharacteristic.getDescriptors: TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTCharacteristic.readValue: TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTCharacteristic.startNotifications: TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTCharacteristic.stopNotifications: TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTCharacteristic.writeValue(
  value: TJSBufferSource): TJSPromise;
begin

end;

{ TJSBluetoothRemoteGATTDescriptor }

function TJSBluetoothRemoteGATTDescriptor.readValue: TJSPromise;
begin

end;

function TJSBluetoothRemoteGATTDescriptor.writeValue(
  value: TJSBufferSource): TJSPromise;
begin

end;

{ TJSBluetoothUUID }

function TJSBluetoothUUID.canonicalUUID(alias: NativeInt): UUID;
begin

end;

function TJSBluetoothUUID.getCharacteristic(name: JSValue): UUID;
begin

end;

function TJSBluetoothUUID.getDescriptor(name: JSValue): UUID;
begin

end;

function TJSBluetoothUUID.getService(name: JSValue): UUID;
begin

end;
{$ENDIF}
end.
