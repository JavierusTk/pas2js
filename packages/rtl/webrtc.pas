Unit webrtc;

{$IFDEF PAS2JS}
{$MODE ObjFPC}
{$H+}
{$modeswitch externalclass}
{$ENDIF}

interface

uses SysUtils, JS, web{$IFDEF DCC}, types{$ENDIF};

{
  Automatically generated file by TWebIDLToPas on 2020-03-23 14:48:13
  
  Used command-line options : 
  -x
  web
  -i
  /home/michael/webrtc.idl
  -d
  TJSObject
  -t
  DOMTimeStamp=String,Mediastream=TJSHTMLMediaStream,DOMHighResTimeStamp=double,MediaStreamTrack=JSValue,RTCStatsType=String,EventTarget=TJSEventTarget,EventHandler=TJSEventHandler,Promise=TJSPromise,VoidFunction=TProcedure,Event=TJSEvent,Blob=TJSBlob,ArrayBufferView=TJSTypedArray
  -p
  
  Command-line options translate to: 
  
  Options : [coDictionaryAsClass,coaddOptionsToheader]
  Keyword prefix : 
  Keyword suffix : _
  Class prefix : TJS
  Class suffix : 
  Field prefix : F
  WEBIDLversion : v2
  Type aliases:
  DOMTimeStamp=String
  Mediastream=TJSHTMLMediaStream
  DOMHighResTimeStamp=double
  MediaStreamTrack=JSValue
  RTCStatsType=String
  EventTarget=TJSEventTarget
  EventHandler=TJSEventHandler
  Promise=TJSPromise
  VoidFunction=TProcedure
  Event=TJSEvent
  Blob=TJSBlob
  ArrayBufferView=TJSTypedArray
}
Type
  // Forward class definitions
  TJSRTCPeerConnection = Class;
  TJSRTCSessionDescription = Class;
  TJSRTCIceCandidate = Class;
  TJSRTCPeerConnectionIceEvent = Class;
  TJSRTCPeerConnectionIceErrorEvent = Class;
  TJSRTCCertificate = Class;
  TJSRTCRtpSender = Class;
  TJSRTCRtpReceiver = Class;
  TJSRTCRtpTransceiver = Class;
  TJSRTCDtlsTransport = Class;
  TJSRTCIceTransport = Class;
  TJSRTCTrackEvent = Class;
  TJSRTCSctpTransport = Class;
  TJSRTCDataChannel = Class;
  TJSRTCDataChannelEvent = Class;
  TJSRTCDTMFSender = Class;
  TJSRTCDTMFToneChangeEvent = Class;
  TJSRTCStatsReport = Class;
  TJSRTCError = Class;
  TJSRTCErrorEvent = Class;
  TJSRTCConfiguration = Class;
  TJSRTCIceServer = Class;
  TJSRTCOfferAnswerOptions = Class;
  TJSRTCOfferOptions = Class;
  TJSRTCAnswerOptions = Class;
  TJSRTCSessionDescriptionInit = Class;
  TJSRTCIceCandidateInit = Class;
  TJSRTCPeerConnectionIceEventInit = Class;
  TJSRTCPeerConnectionIceErrorEventInit = Class;
  TJSRTCCertificateExpiration = Class;
  TJSRTCRtpTransceiverInit = Class;
  TJSRTCRtpParameters = Class;
  TJSRTCRtpSendParameters = Class;
  TJSRTCRtpReceiveParameters = Class;
  TJSRTCRtpCodingParameters = Class;
  TJSRTCRtpDecodingParameters = Class;
  TJSRTCRtpEncodingParameters = Class;
  TJSRTCRtcpParameters = Class;
  TJSRTCRtpHeaderExtensionParameters = Class;
  TJSRTCRtpCodecParameters = Class;
  TJSRTCRtpCapabilities = Class;
  TJSRTCRtpCodecCapability = Class;
  TJSRTCRtpHeaderExtensionCapability = Class;
  TJSRTCRtpContributingSource = Class;
  TJSRTCRtpSynchronizationSource = Class;
  TJSRTCDtlsFingerprint = Class;
  TJSRTCIceParameters = Class;
  TJSRTCIceCandidatePair = Class;
  TJSRTCTrackEventInit = Class;
  TJSRTCDataChannelInit = Class;
  TJSRTCDataChannelEventInit = Class;
  TJSRTCDTMFToneChangeEventInit = Class;
  TJSRTCStats = Class;
  TJSRTCErrorInit = Class;
  TJSRTCErrorEventInit = Class;
  RTCIceCredentialType = String;
  RTCIceTransportPolicy = String;
  RTCBundlePolicy = String;
  RTCRtcpMuxPolicy = String;
  RTCSignalingState = String;
  RTCIceGatheringState = String;
  RTCPeerConnectionState = String;
  RTCIceConnectionState = String;
  RTCSdpType = String;
  RTCIceProtocol = String;
  RTCIceTcpCandidateType = String;
  RTCIceCandidateType = String;
  RTCRtpTransceiverDirection = String;
  RTCDegradationPreference = String;
  RTCDtlsTransportState = String;
  RTCIceGathererState = String;
  RTCIceTransportState = String;
  RTCIceRole = String;
  RTCIceComponent = String;
  RTCSctpTransportState = String;
  RTCDataChannelState = String;
  RTCErrorDetailType = String;
  RTCPeerConnectionErrorCallback = Procedure (error : TJSError);
  RTCSessionDescriptionCallback = Procedure (description : TJSRTCSessionDescriptionInit);
  
  { --------------------------------------------------------------------
    TJSRTCConfiguration
    --------------------------------------------------------------------}
  
  TTJSRTCIceServerDynArray = Array of TJSRTCIceServer;
  TTJSRTCCertificateDynArray = Array of TJSRTCCertificate;
  TJSRTCConfiguration = class(TJSObject)
    iceServers : TTJSRTCIceServerDynArray;
    iceTransportPolicy : RTCIceTransportPolicy;
    bundlePolicy : RTCBundlePolicy;
    rtcpMuxPolicy : RTCRtcpMuxPolicy;
    peerIdentity : String;
    certificates : TTJSRTCCertificateDynArray;
    iceCandidatePoolSize : Byte;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCIceServer
    --------------------------------------------------------------------}
  
  TJSRTCIceServer = class(TJSObject)
    urls : JSValue;
    username : String;
    credentialType : RTCIceCredentialType;
  end;

  { --------------------------------------------------------------------
    TJSRTCOfferAnswerOptions
    --------------------------------------------------------------------}
  
  TJSRTCOfferAnswerOptions = class(TJSObject)
  end;
  
  { --------------------------------------------------------------------
    TJSRTCOfferOptions
    --------------------------------------------------------------------}
  
  TJSRTCOfferOptions = class(TJSObject)
    iceRestart : boolean;
    offerToReceiveAudio : boolean;
    offerToReceiveVideo : boolean;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCAnswerOptions
    --------------------------------------------------------------------}
  
  TJSRTCAnswerOptions = class(TJSObject)
  end;
  
  { --------------------------------------------------------------------
    TJSRTCSessionDescriptionInit
    --------------------------------------------------------------------}
  
  TJSRTCSessionDescriptionInit = class(TJSObject)
    type_ : RTCSdpType; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    sdp : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCIceCandidateInit
    --------------------------------------------------------------------}

  TJSRTCIceCandidateInit = class(TJSObject)
    candidate : String;
    sdpMid : String;
    sdpMLineIndex : Cardinal;
    usernameFragment : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCPeerConnectionIceEventInit
    --------------------------------------------------------------------}
  
  TJSRTCPeerConnectionIceEventInit = class(TJSObject)
    candidate : TJSRTCIceCandidate;
    url : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCPeerConnectionIceErrorEventInit
    --------------------------------------------------------------------}
  
  TJSRTCPeerConnectionIceErrorEventInit = class(TJSObject)
    hostCandidate : String;
    url : String;
    errorCode : Cardinal;
    statusText : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCCertificateExpiration
    --------------------------------------------------------------------}
  
  TJSRTCCertificateExpiration = class(TJSObject)
    expires : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpTransceiverInit
    --------------------------------------------------------------------}
  
  TTJSHTMLMediaStreamDynArray = Array of TJSHTMLMediaStream;
  TTJSRTCRtpEncodingParametersDynArray = Array of TJSRTCRtpEncodingParameters;
  TJSRTCRtpTransceiverInit = class(TJSObject)
    direction : RTCRtpTransceiverDirection;
    streams : TTJSHTMLMediaStreamDynArray;
    sendEncodings : TTJSRTCRtpEncodingParametersDynArray;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpParameters
    --------------------------------------------------------------------}
  
  TTJSRTCRtpHeaderExtensionParametersDynArray = Array of TJSRTCRtpHeaderExtensionParameters;
  TTJSRTCRtpCodecParametersDynArray = Array of TJSRTCRtpCodecParameters;
  TJSRTCRtpParameters = class(TJSObject)
    headerExtensions : TTJSRTCRtpHeaderExtensionParametersDynArray;
    rtcp : TJSRTCRtcpParameters;
    codecs : TTJSRTCRtpCodecParametersDynArray;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpSendParameters
    --------------------------------------------------------------------}
  
  TJSRTCRtpSendParameters = class(TJSObject)
    transactionId : String;
    encodings : TTJSRTCRtpEncodingParametersDynArray;
    degradationPreference : RTCDegradationPreference;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpReceiveParameters
    --------------------------------------------------------------------}
  
  TTJSRTCRtpDecodingParametersDynArray = Array of TJSRTCRtpDecodingParameters;
  TJSRTCRtpReceiveParameters = class(TJSObject)
    encodings : TTJSRTCRtpDecodingParametersDynArray;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpCodingParameters
    --------------------------------------------------------------------}
  
  TJSRTCRtpCodingParameters = class(TJSObject)
    rid : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpDecodingParameters
    --------------------------------------------------------------------}
  
  TJSRTCRtpDecodingParameters = class(TJSObject)
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpEncodingParameters
    --------------------------------------------------------------------}
  
  TJSRTCRtpEncodingParameters = class(TJSObject)
    active : boolean;
    maxBitrate : NativeInt;
    scaleResolutionDownBy : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtcpParameters
    --------------------------------------------------------------------}
  
  TJSRTCRtcpParameters = class(TJSObject)
    cname : String;
    reducedSize : boolean;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpHeaderExtensionParameters
    --------------------------------------------------------------------}
  
  TJSRTCRtpHeaderExtensionParameters = class(TJSObject)
    uri : String;
    id : Cardinal;
    encrypted : boolean;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpCodecParameters
    --------------------------------------------------------------------}
  
  TJSRTCRtpCodecParameters = class(TJSObject)
    payloadType : Byte;
    mimeType : String;
    clockRate : NativeInt;
    channels : Cardinal;
    sdpFmtpLine : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpCapabilities
    --------------------------------------------------------------------}
  
  TTJSRTCRtpCodecCapabilityDynArray = Array of TJSRTCRtpCodecCapability;
  TTJSRTCRtpHeaderExtensionCapabilityDynArray = Array of TJSRTCRtpHeaderExtensionCapability;
  TJSRTCRtpCapabilities = class(TJSObject)
    codecs : TTJSRTCRtpCodecCapabilityDynArray;
    headerExtensions : TTJSRTCRtpHeaderExtensionCapabilityDynArray;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpCodecCapability
    --------------------------------------------------------------------}
  
  TJSRTCRtpCodecCapability = class(TJSObject)
    mimeType : String;
    clockRate : NativeInt;
    channels : Cardinal;
    sdpFmtpLine : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpHeaderExtensionCapability
    --------------------------------------------------------------------}
  
  TJSRTCRtpHeaderExtensionCapability = class(TJSObject)
    uri : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpContributingSource
    --------------------------------------------------------------------}
  
  TJSRTCRtpContributingSource = class(TJSObject)
    timestamp : double;
    source : NativeInt;
    audioLevel : Double;
    rtpTimestamp : NativeInt;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpSynchronizationSource
    --------------------------------------------------------------------}
  
  TJSRTCRtpSynchronizationSource = class(TJSObject)
    voiceActivityFlag : boolean;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCDtlsFingerprint
    --------------------------------------------------------------------}
  
  TJSRTCDtlsFingerprint = class(TJSObject)
    algorithm : String;
    value : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCIceParameters
    --------------------------------------------------------------------}
  
  TJSRTCIceParameters = class(TJSObject)
    usernameFragment : String;
    password : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCIceCandidatePair
    --------------------------------------------------------------------}
  
  TJSRTCIceCandidatePair = class(TJSObject)
    local : TJSRTCIceCandidate;
    remote : TJSRTCIceCandidate;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCTrackEventInit
    --------------------------------------------------------------------}
  
  TJSRTCTrackEventInit = class(TJSObject)
    receiver : TJSRTCRtpReceiver;
    track : JSValue;
    streams : TTJSHTMLMediaStreamDynArray;
    transceiver : TJSRTCRtpTransceiver;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCDataChannelInit
    --------------------------------------------------------------------}
  
  TJSRTCDataChannelInit = class(TJSObject)
    ordered : boolean;
    maxPacketLifeTime : Cardinal;
    maxRetransmits : Cardinal;
    protocol : String;
    negotiated : boolean;
    id : Cardinal;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCDataChannelEventInit
    --------------------------------------------------------------------}
  
  TJSRTCDataChannelEventInit = class(TJSObject)
    channel : TJSRTCDataChannel;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCDTMFToneChangeEventInit
    --------------------------------------------------------------------}
  
  TJSRTCDTMFToneChangeEventInit = class(TJSObject)
    tone : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCStats
    --------------------------------------------------------------------}
  
  TJSRTCStats = class(TJSObject)
    timestamp : double;
    type_ : String; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    id : String;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCErrorInit
    --------------------------------------------------------------------}
  
  TJSRTCErrorInit = class(TJSObject)
    errorDetail : RTCErrorDetailType;
    sdpLineNumber : Integer;
    httpRequestStatusCode : Integer;
    sctpCauseCode : Integer;
    receivedAlert : NativeInt;
    sentAlert : NativeInt;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCErrorEventInit
    --------------------------------------------------------------------}
  
  TJSRTCErrorEventInit = class(TJSObject)
    error : TJSRTCError;
  end;
  
  { --------------------------------------------------------------------
    TJSRTCPeerConnection
    --------------------------------------------------------------------}
  
  TTJSRTCRtpSenderDynArray = Array of TJSRTCRtpSender;
  TTJSRTCRtpReceiverDynArray = Array of TJSRTCRtpReceiver;
  TTJSRTCRtpTransceiverDynArray = Array of TJSRTCRtpTransceiver;

  TJSRTCPeerConnection = class {$IFDEF PAS2JS}external name 'RTCPeerConnection'{$ENDIF} (TJSEventTarget)
  Private
    FlocalDescription : TJSRTCSessionDescription; {$IFDEF PAS2JS}external name 'localDescription';{$ENDIF}
    FcurrentLocalDescription : TJSRTCSessionDescription; {$IFDEF PAS2JS}external name 'currentLocalDescription';{$ENDIF}
    FpendingLocalDescription : TJSRTCSessionDescription; {$IFDEF PAS2JS}external name 'pendingLocalDescription';{$ENDIF}
    FremoteDescription : TJSRTCSessionDescription; {$IFDEF PAS2JS}external name 'remoteDescription';{$ENDIF}
    FcurrentRemoteDescription : TJSRTCSessionDescription; {$IFDEF PAS2JS}external name 'currentRemoteDescription';{$ENDIF}
    FpendingRemoteDescription : TJSRTCSessionDescription; {$IFDEF PAS2JS}external name 'pendingRemoteDescription';{$ENDIF}
    FsignalingState : RTCSignalingState; {$IFDEF PAS2JS}external name 'signalingState';{$ENDIF}
    FiceGatheringState : RTCIceGatheringState; {$IFDEF PAS2JS}external name 'iceGatheringState';{$ENDIF}
    FiceConnectionState : RTCIceConnectionState; {$IFDEF PAS2JS}external name 'iceConnectionState';{$ENDIF}
    FconnectionState : RTCPeerConnectionState; {$IFDEF PAS2JS}external name 'connectionState';{$ENDIF}
    FcanTrickleIceCandidates : boolean; {$IFDEF PAS2JS}external name 'canTrickleIceCandidates';{$ENDIF}
    Fsctp : TJSRTCSctpTransport; {$IFDEF PAS2JS}external name 'sctp';{$ENDIF}
  Public
    
      onnegotiationneeded : TJSEventHandler;
      onicecandidate : TJSEventHandler;
      onicecandidateerror : TJSEventHandler;
      onsignalingstatechange : TJSEventHandler;
      oniceconnectionstatechange : TJSEventHandler;
      onicegatheringstatechange : TJSEventHandler;
      onconnectionstatechange : TJSEventHandler;
      ontrack : TJSEventHandler;
      ondatachannel : TJSEventHandler;
    constructor New(configuration : TJSRTCConfiguration); overload;
    constructor New; overload;
    function createOffer(options : TJSRTCOfferOptions): TJSPromise; overload;
    function createOffer: TJSPromise; overload;
    function createAnswer(options : TJSRTCAnswerOptions): TJSPromise; overload;
    function createAnswer: TJSPromise; overload;
    function setLocalDescription(description : TJSRTCSessionDescriptionInit): TJSPromise; overload;
    function setLocalDescription: TJSPromise; overload;
    function setRemoteDescription(description : TJSRTCSessionDescriptionInit): TJSPromise; overload;
    function setRemoteDescription: TJSPromise; overload;
    function addIceCandidate(candidate : TJSRTCIceCandidateInit): TJSPromise; overload;
    function addIceCandidate: TJSPromise; overload;
    Procedure restartIce;
    function getConfiguration: TJSRTCConfiguration;
    Procedure setConfiguration(configuration : TJSRTCConfiguration);
    Procedure close;
    function createOffer(successCallback : RTCSessionDescriptionCallback; failureCallback : RTCPeerConnectionErrorCallback; options : TJSRTCOfferOptions): TJSPromise; overload;
    function createOffer(successCallback : RTCSessionDescriptionCallback; failureCallback : RTCPeerConnectionErrorCallback): TJSPromise; overload;
    function createAnswer(successCallback : RTCSessionDescriptionCallback; failureCallback : RTCPeerConnectionErrorCallback): TJSPromise; overload;
    function addIceCandidate(candidate : TJSRTCIceCandidateInit; successCallback : TProcedure; failureCallback : RTCPeerConnectionErrorCallback): TJSPromise; overload;
    function generateCertificate(keygenAlgorithm : AlgorithmIdentifier): TJSPromise;
    function getSenders: TTJSRTCRtpSenderDynArray;
    function getReceivers: TTJSRTCRtpReceiverDynArray;
    function getTransceivers: TTJSRTCRtpTransceiverDynArray;
    function addTrack(track : JSValue; streams : TJSHTMLMediaStream): TJSRTCRtpSender; {$IFDEF PAS2JS}varargs;{$ENDIF}
    Procedure removeTrack(sender : TJSRTCRtpSender);
    function addTransceiver(trackOrKind : JSValue; init : TJSRTCRtpTransceiverInit): TJSRTCRtpTransceiver; overload;
    function addTransceiver(trackOrKind : JSValue): TJSRTCRtpTransceiver; overload;
    function createDataChannel(label_ : String; dataChannelDict : TJSRTCDataChannelInit): TJSRTCDataChannel; overload;
    function createDataChannel(label_ : String): TJSRTCDataChannel; overload;
    function getStats(selector : JSValue): TJSPromise; overload;
    function getStats: TJSPromise; overload;
    Property localDescription : TJSRTCSessionDescription Read FlocalDescription; 
    Property currentLocalDescription : TJSRTCSessionDescription Read FcurrentLocalDescription; 
    Property pendingLocalDescription : TJSRTCSessionDescription Read FpendingLocalDescription; 
    Property remoteDescription : TJSRTCSessionDescription Read FremoteDescription; 
    Property currentRemoteDescription : TJSRTCSessionDescription Read FcurrentRemoteDescription; 
    Property pendingRemoteDescription : TJSRTCSessionDescription Read FpendingRemoteDescription; 
    Property signalingState : RTCSignalingState Read FsignalingState; 
    Property iceGatheringState : RTCIceGatheringState Read FiceGatheringState; 
    Property iceConnectionState : RTCIceConnectionState Read FiceConnectionState; 
    Property connectionState : RTCPeerConnectionState Read FconnectionState; 
    Property canTrickleIceCandidates : boolean Read FcanTrickleIceCandidates; 
    Property sctp : TJSRTCSctpTransport Read Fsctp; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCSessionDescription
    --------------------------------------------------------------------}
  
  TJSRTCSessionDescription = class {$IFDEF PAS2JS}external name 'RTCSessionDescription'{$ENDIF}
  Private
    Ftype_ : RTCSdpType; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    Fsdp : String; {$IFDEF PAS2JS}external name 'sdp';{$ENDIF}
  Public
    constructor New(descriptionInitDict : TJSRTCSessionDescriptionInit); overload;
    constructor New; overload;
    function toJSON: TJSObject;
    Property type_ : RTCSdpType Read Ftype_; 
    Property sdp : String Read Fsdp; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCIceCandidate
    --------------------------------------------------------------------}
  
  TJSRTCIceCandidate = class {$IFDEF PAS2JS}external name 'RTCIceCandidate'{$ENDIF}
  Private
    Fcandidate : String; {$IFDEF PAS2JS}external name 'candidate';{$ENDIF}
    FsdpMid : String; {$IFDEF PAS2JS}external name 'sdpMid';{$ENDIF}
    FsdpMLineIndex : Cardinal; {$IFDEF PAS2JS}external name 'sdpMLineIndex';{$ENDIF}
    Ffoundation : String; {$IFDEF PAS2JS}external name 'foundation';{$ENDIF}
    Fcomponent : RTCIceComponent; {$IFDEF PAS2JS}external name 'component';{$ENDIF}
    Fpriority : NativeInt; {$IFDEF PAS2JS}external name 'priority';{$ENDIF}
    Faddress : String; {$IFDEF PAS2JS}external name 'address';{$ENDIF}
    Fprotocol : RTCIceProtocol; {$IFDEF PAS2JS}external name 'protocol';{$ENDIF}
    Fport : Cardinal; {$IFDEF PAS2JS}external name 'port';{$ENDIF}
    Ftype_ : RTCIceCandidateType; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    FtcpType : RTCIceTcpCandidateType; {$IFDEF PAS2JS}external name 'tcpType';{$ENDIF}
    FrelatedAddress : String; {$IFDEF PAS2JS}external name 'relatedAddress';{$ENDIF}
    FrelatedPort : Cardinal; {$IFDEF PAS2JS}external name 'relatedPort';{$ENDIF}
    FusernameFragment : String; {$IFDEF PAS2JS}external name 'usernameFragment';{$ENDIF}
  Public
    constructor New(candidateInitDict : TJSRTCIceCandidateInit); overload;
    constructor New; overload;
    function toJSON: TJSRTCIceCandidateInit;
    Property candidate : String Read Fcandidate; 
    Property sdpMid : String Read FsdpMid; 
    Property sdpMLineIndex : Cardinal Read FsdpMLineIndex; 
    Property foundation : String Read Ffoundation; 
    Property component : RTCIceComponent Read Fcomponent; 
    Property priority : NativeInt Read Fpriority; 
    Property address : String Read Faddress; 
    Property protocol : RTCIceProtocol Read Fprotocol; 
    Property port : Cardinal Read Fport; 
    Property type_ : RTCIceCandidateType Read Ftype_; 
    Property tcpType : RTCIceTcpCandidateType Read FtcpType; 
    Property relatedAddress : String Read FrelatedAddress; 
    Property relatedPort : Cardinal Read FrelatedPort; 
    Property usernameFragment : String Read FusernameFragment; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCPeerConnectionIceEvent
    --------------------------------------------------------------------}
  
  TJSRTCPeerConnectionIceEvent = class {$IFDEF PAS2JS}external name 'RTCPeerConnectionIceEvent'{$ENDIF} (TJSEvent)
  Private
    Fcandidate : TJSRTCIceCandidate; {$IFDEF PAS2JS}external name 'candidate';{$ENDIF}
    Furl : String; {$IFDEF PAS2JS}external name 'url';{$ENDIF}
  Public
    constructor New(type_ : String; eventInitDict : TJSRTCPeerConnectionIceEventInit); overload;
    constructor New(type_ : String); overload;
    Property candidate : TJSRTCIceCandidate Read Fcandidate; 
    Property url : String Read Furl; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCPeerConnectionIceErrorEvent
    --------------------------------------------------------------------}
  
  TJSRTCPeerConnectionIceErrorEvent = class {$IFDEF PAS2JS}external name 'RTCPeerConnectionIceErrorEvent'{$ENDIF} (TJSEvent)
  Private
    Faddress : String; {$IFDEF PAS2JS}external name 'address';{$ENDIF}
    Fport : Cardinal; {$IFDEF PAS2JS}external name 'port';{$ENDIF}
    Furl : String; {$IFDEF PAS2JS}external name 'url';{$ENDIF}
    FerrorCode : Cardinal; {$IFDEF PAS2JS}external name 'errorCode';{$ENDIF}
    FerrorText : String; {$IFDEF PAS2JS}external name 'errorText';{$ENDIF}
  Public
    constructor New(type_ : String; eventInitDict : TJSRTCPeerConnectionIceErrorEventInit);
    Property address : String Read Faddress; 
    Property port : Cardinal Read Fport; 
    Property url : String Read Furl; 
    Property errorCode : Cardinal Read FerrorCode; 
    Property errorText : String Read FerrorText; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCCertificate
    --------------------------------------------------------------------}
  
  TTJSRTCDtlsFingerprintDynArray = Array of TJSRTCDtlsFingerprint;
  
  TJSRTCCertificate = class {$IFDEF PAS2JS}external name 'RTCCertificate'{$ENDIF}
  Private
    Fexpires : String; {$IFDEF PAS2JS}external name 'expires';{$ENDIF}
  Public
    function getFingerprints: TTJSRTCDtlsFingerprintDynArray;
    Property expires : String Read Fexpires; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpSender
    --------------------------------------------------------------------}
  
  TJSRTCRtpSender = class {$IFDEF PAS2JS}external name 'RTCRtpSender'{$ENDIF}
  Private
    Ftrack : JSValue; {$IFDEF PAS2JS}external name 'track';{$ENDIF}
    Ftransport : TJSRTCDtlsTransport; {$IFDEF PAS2JS}external name 'transport';{$ENDIF}
    Fdtmf : TJSRTCDTMFSender; {$IFDEF PAS2JS}external name 'dtmf';{$ENDIF}
  Public
    function getCapabilities(kind : String): TJSRTCRtpCapabilities;
    function setParameters(parameters : TJSRTCRtpSendParameters): TJSPromise;
    function getParameters: TJSRTCRtpSendParameters;
    function replaceTrack(withTrack : JSValue): TJSPromise;
    Procedure setStreams(streams : TJSHTMLMediaStream); {$IFDEF PAS2JS}varargs;{$ENDIF}
    function getStats: TJSPromise;
    Property track : JSValue Read Ftrack; 
    Property transport : TJSRTCDtlsTransport Read Ftransport; 
    Property dtmf : TJSRTCDTMFSender Read Fdtmf; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpReceiver
    --------------------------------------------------------------------}
  
  TTJSRTCRtpContributingSourceDynArray = Array of TJSRTCRtpContributingSource;
  TTJSRTCRtpSynchronizationSourceDynArray = Array of TJSRTCRtpSynchronizationSource;
  
  TJSRTCRtpReceiver = class {$IFDEF PAS2JS}external name 'RTCRtpReceiver'{$ENDIF}
  Private
    Ftrack : JSValue; {$IFDEF PAS2JS}external name 'track';{$ENDIF}
    Ftransport : TJSRTCDtlsTransport; {$IFDEF PAS2JS}external name 'transport';{$ENDIF}
  Public
    function getCapabilities(kind : String): TJSRTCRtpCapabilities;
    function getParameters: TJSRTCRtpReceiveParameters;
    function getContributingSources: TTJSRTCRtpContributingSourceDynArray;
    function getSynchronizationSources: TTJSRTCRtpSynchronizationSourceDynArray;
    function getStats: TJSPromise;
    Property track : JSValue Read Ftrack; 
    Property transport : TJSRTCDtlsTransport Read Ftransport; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCRtpTransceiver
    --------------------------------------------------------------------}
  
  TJSRTCRtpTransceiver = class {$IFDEF PAS2JS}external name 'RTCRtpTransceiver'{$ENDIF}
  Private
    Fmid : String; {$IFDEF PAS2JS}external name 'mid';{$ENDIF}
    Fsender : TJSRTCRtpSender; {$IFDEF PAS2JS}external name 'sender';{$ENDIF}
    Freceiver : TJSRTCRtpReceiver; {$IFDEF PAS2JS}external name 'receiver';{$ENDIF}
    FcurrentDirection : RTCRtpTransceiverDirection; {$IFDEF PAS2JS}external name 'currentDirection';{$ENDIF}
  Public
      direction : RTCRtpTransceiverDirection;
    Procedure stop;
    Procedure setCodecPreferences(codecs : TTJSRTCRtpCodecCapabilityDynArray);
    Property mid : String Read Fmid; 
    Property sender : TJSRTCRtpSender Read Fsender; 
    Property receiver : TJSRTCRtpReceiver Read Freceiver; 
    Property currentDirection : RTCRtpTransceiverDirection Read FcurrentDirection; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCDtlsTransport
    --------------------------------------------------------------------}
  
  TTJSArrayBufferDynArray = Array of TJSArrayBuffer;
  
  TJSRTCDtlsTransport = class {$IFDEF PAS2JS}external name 'RTCDtlsTransport'{$ENDIF} (TJSEventTarget)
  Private
    FiceTransport : TJSRTCIceTransport; {$IFDEF PAS2JS}external name 'iceTransport';{$ENDIF}
    Fstate : RTCDtlsTransportState; {$IFDEF PAS2JS}external name 'state';{$ENDIF}
  Public
      onstatechange : TJSEventHandler;
      onerror : TJSEventHandler;
    function getRemoteCertificates: TTJSArrayBufferDynArray;
    Property iceTransport : TJSRTCIceTransport Read FiceTransport; 
    Property state : RTCDtlsTransportState Read Fstate; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCIceTransport
    --------------------------------------------------------------------}
  
  TTJSRTCIceCandidateDynArray = Array of TJSRTCIceCandidate;
  
  TJSRTCIceTransport = class {$IFDEF PAS2JS}external name 'RTCIceTransport'{$ENDIF} (TJSEventTarget)
  Private
    Frole : RTCIceRole; {$IFDEF PAS2JS}external name 'role';{$ENDIF}
    Fcomponent : RTCIceComponent; {$IFDEF PAS2JS}external name 'component';{$ENDIF}
    Fstate : RTCIceTransportState; {$IFDEF PAS2JS}external name 'state';{$ENDIF}
    FgatheringState : RTCIceGathererState; {$IFDEF PAS2JS}external name 'gatheringState';{$ENDIF}
  Public
      onstatechange : TJSEventHandler;
      ongatheringstatechange : TJSEventHandler;
      onselectedcandidatepairchange : TJSEventHandler;
    function getLocalCandidates: TTJSRTCIceCandidateDynArray;
    function getRemoteCandidates: TTJSRTCIceCandidateDynArray;
    function getSelectedCandidatePair: TJSRTCIceCandidatePair;
    function getLocalParameters: TJSRTCIceParameters;
    function getRemoteParameters: TJSRTCIceParameters;
    Property role : RTCIceRole Read Frole; 
    Property component : RTCIceComponent Read Fcomponent; 
    Property state : RTCIceTransportState Read Fstate; 
    Property gatheringState : RTCIceGathererState Read FgatheringState; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCTrackEvent
    --------------------------------------------------------------------}
  
  TJSRTCTrackEvent = class {$IFDEF PAS2JS}external name 'RTCTrackEvent'{$ENDIF} (TJSEvent)
  Private
    Freceiver : TJSRTCRtpReceiver; {$IFDEF PAS2JS}external name 'receiver';{$ENDIF}
    Ftrack : JSValue; {$IFDEF PAS2JS}external name 'track';{$ENDIF}
    Fstreams : TTJSHTMLMediaStreamDynArray; {$IFDEF PAS2JS}external name 'streams';{$ENDIF}
    Ftransceiver : TJSRTCRtpTransceiver; {$IFDEF PAS2JS}external name 'transceiver';{$ENDIF}
  Public
    constructor New(type_ : String; eventInitDict : TJSRTCTrackEventInit);
    Property receiver : TJSRTCRtpReceiver Read Freceiver; 
    Property track : JSValue Read Ftrack; 
    Property streams : TTJSHTMLMediaStreamDynArray Read Fstreams; 
    Property transceiver : TJSRTCRtpTransceiver Read Ftransceiver; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCSctpTransport
    --------------------------------------------------------------------}
  
  TJSRTCSctpTransport = class {$IFDEF PAS2JS}external name 'RTCSctpTransport'{$ENDIF} (TJSEventTarget)
  Private
    Ftransport : TJSRTCDtlsTransport; {$IFDEF PAS2JS}external name 'transport';{$ENDIF}
    Fstate : RTCSctpTransportState; {$IFDEF PAS2JS}external name 'state';{$ENDIF}
    FmaxMessageSize : Double; {$IFDEF PAS2JS}external name 'maxMessageSize';{$ENDIF}
    FmaxChannels : Cardinal; {$IFDEF PAS2JS}external name 'maxChannels';{$ENDIF}
  Public
      onstatechange : TJSEventHandler;
    Property transport : TJSRTCDtlsTransport Read Ftransport;
    Property state : RTCSctpTransportState Read Fstate; 
    Property maxMessageSize : Double Read FmaxMessageSize;
    Property maxChannels : Cardinal Read FmaxChannels; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCDataChannel
    --------------------------------------------------------------------}
  
  TJSRTCDataChannel = class {$IFDEF PAS2JS}external name 'RTCDataChannel'{$ENDIF} (TJSEventTarget)
  Private
    Flabel_ : String; {$IFDEF PAS2JS}external name 'label';{$ENDIF}
    Fordered : boolean; {$IFDEF PAS2JS}external name 'ordered';{$ENDIF}
    FmaxPacketLifeTime : Cardinal; {$IFDEF PAS2JS}external name 'maxPacketLifeTime';{$ENDIF}
    FmaxRetransmits : Cardinal; {$IFDEF PAS2JS}external name 'maxRetransmits';{$ENDIF}
    Fprotocol : String; {$IFDEF PAS2JS}external name 'protocol';{$ENDIF}
    Fnegotiated : boolean; {$IFDEF PAS2JS}external name 'negotiated';{$ENDIF}
    Fid : Cardinal; {$IFDEF PAS2JS}external name 'id';{$ENDIF}
    FreadyState : RTCDataChannelState; {$IFDEF PAS2JS}external name 'readyState';{$ENDIF}
    FbufferedAmount : NativeInt; {$IFDEF PAS2JS}external name 'bufferedAmount';{$ENDIF}
  Public
      bufferedAmountLowThreshold : NativeInt;
      onopen : TJSEventHandler;
      onbufferedamountlow : TJSEventHandler;
      onerror : TJSEventHandler;
      onclosing : TJSEventHandler;
      onclose : TJSEventHandler;
      onmessage : TJSEventHandler;
      binaryType : String;
    Procedure close;
    Procedure send(data : String); overload;
    Procedure send(data : TJSBlob); overload;
    Procedure send(data : TJSArrayBuffer); overload;
    Procedure send(data : TJSTypedArray); overload;
    Property label_ : String Read Flabel_; 
    Property ordered : boolean Read Fordered; 
    Property maxPacketLifeTime : Cardinal Read FmaxPacketLifeTime; 
    Property maxRetransmits : Cardinal Read FmaxRetransmits; 
    Property protocol : String Read Fprotocol; 
    Property negotiated : boolean Read Fnegotiated; 
    Property id : Cardinal Read Fid; 
    Property readyState : RTCDataChannelState Read FreadyState; 
    Property bufferedAmount : NativeInt Read FbufferedAmount; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCDataChannelEvent
    --------------------------------------------------------------------}
  
  TJSRTCDataChannelEvent = class {$IFDEF PAS2JS}external name 'RTCDataChannelEvent'{$ENDIF} (TJSEvent)
  Private
    Fchannel : TJSRTCDataChannel; {$IFDEF PAS2JS}external name 'channel';{$ENDIF}
  Public
    constructor New(type_ : String; eventInitDict : TJSRTCDataChannelEventInit);
    Property channel : TJSRTCDataChannel Read Fchannel; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCDTMFSender
    --------------------------------------------------------------------}

  TJSRTCDTMFSender = class {$IFDEF PAS2JS}external name 'RTCDTMFSender'{$ENDIF} (TJSEventTarget)
  Private
    FcanInsertDTMF : boolean; {$IFDEF PAS2JS}external name 'canInsertDTMF';{$ENDIF}
    FtoneBuffer : String; {$IFDEF PAS2JS}external name 'toneBuffer';{$ENDIF}
  Public
      ontonechange : TJSEventHandler;
    Procedure insertDTMF(tones : String; duration : NativeInt; interToneGap : NativeInt); overload;
    Procedure insertDTMF(tones : String); overload;
    Procedure insertDTMF(tones : String; duration : NativeInt); overload;
    Property canInsertDTMF : boolean Read FcanInsertDTMF; 
    Property toneBuffer : String Read FtoneBuffer; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCDTMFToneChangeEvent
    --------------------------------------------------------------------}
  
  TJSRTCDTMFToneChangeEvent = class {$IFDEF PAS2JS}external name 'RTCDTMFToneChangeEvent'{$ENDIF} (TJSEvent)
  Private
    Ftone : String; {$IFDEF PAS2JS}external name 'tone';{$ENDIF}
  Public
    constructor New(type_ : String; eventInitDict : TJSRTCDTMFToneChangeEventInit);
    Property tone : String Read Ftone; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCStatsReport
    --------------------------------------------------------------------}
  
  TJSRTCStatsReport = class {$IFDEF PAS2JS}external name 'RTCStatsReport'{$ENDIF}
  Private
  Public
  end;
  
  { --------------------------------------------------------------------
    TJSRTCError
    --------------------------------------------------------------------}
  
  TJSRTCError = class {$IFDEF PAS2JS}external name 'RTCError'{$ENDIF} (TJSError)
  Private
    FerrorDetail : RTCErrorDetailType; {$IFDEF PAS2JS}external name 'errorDetail';{$ENDIF}
    FsdpLineNumber : Integer; {$IFDEF PAS2JS}external name 'sdpLineNumber';{$ENDIF}
    FhttpRequestStatusCode : Integer; {$IFDEF PAS2JS}external name 'httpRequestStatusCode';{$ENDIF}
    FsctpCauseCode : Integer; {$IFDEF PAS2JS}external name 'sctpCauseCode';{$ENDIF}
    FreceivedAlert : NativeInt; {$IFDEF PAS2JS}external name 'receivedAlert';{$ENDIF}
    FsentAlert : NativeInt; {$IFDEF PAS2JS}external name 'sentAlert';{$ENDIF}
  Public
    constructor New(init : TJSRTCErrorInit; message : String); overload;
    constructor New(init : TJSRTCErrorInit); overload;
    Property errorDetail : RTCErrorDetailType Read FerrorDetail; 
    Property sdpLineNumber : Integer Read FsdpLineNumber; 
    Property httpRequestStatusCode : Integer Read FhttpRequestStatusCode; 
    Property sctpCauseCode : Integer Read FsctpCauseCode; 
    Property receivedAlert : NativeInt Read FreceivedAlert; 
    Property sentAlert : NativeInt Read FsentAlert; 
  end;
  
  { --------------------------------------------------------------------
    TJSRTCErrorEvent
    --------------------------------------------------------------------}
  
  TJSRTCErrorEvent = class {$IFDEF PAS2JS}external name 'RTCErrorEvent'{$ENDIF} (TJSEvent)
  Private
    Ferror : TJSRTCError; {$IFDEF PAS2JS}external name 'error';{$ENDIF}
  Public
    constructor New(type_ : String; eventInitDict : TJSRTCErrorEventInit);
    Property error : TJSRTCError Read Ferror; 
  end;

implementation

{$IFDEF DCC}
{ TJSRTCPeerConnection }

function TJSRTCPeerConnection.addIceCandidate(candidate: TJSRTCIceCandidateInit;
  successCallback: TProcedure;
  failureCallback: RTCPeerConnectionErrorCallback): TJSPromise;
begin

end;

function TJSRTCPeerConnection.addIceCandidate: TJSPromise;
begin

end;

function TJSRTCPeerConnection.addIceCandidate(
  candidate: TJSRTCIceCandidateInit): TJSPromise;
begin

end;

function TJSRTCPeerConnection.addTrack(track: JSValue;
  streams: TJSHTMLMediaStream): TJSRTCRtpSender;
begin

end;

function TJSRTCPeerConnection.addTransceiver(
  trackOrKind: JSValue): TJSRTCRtpTransceiver;
begin

end;

function TJSRTCPeerConnection.addTransceiver(trackOrKind: JSValue;
  init: TJSRTCRtpTransceiverInit): TJSRTCRtpTransceiver;
begin

end;

procedure TJSRTCPeerConnection.close;
begin

end;

function TJSRTCPeerConnection.createAnswer: TJSPromise;
begin

end;

function TJSRTCPeerConnection.createAnswer(
  options: TJSRTCAnswerOptions): TJSPromise;
begin

end;

function TJSRTCPeerConnection.createAnswer(
  successCallback: RTCSessionDescriptionCallback;
  failureCallback: RTCPeerConnectionErrorCallback): TJSPromise;
begin

end;

function TJSRTCPeerConnection.createDataChannel(
  label_: String): TJSRTCDataChannel;
begin

end;

function TJSRTCPeerConnection.createDataChannel(label_: String;
  dataChannelDict: TJSRTCDataChannelInit): TJSRTCDataChannel;
begin

end;

function TJSRTCPeerConnection.createOffer(
  successCallback: RTCSessionDescriptionCallback;
  failureCallback: RTCPeerConnectionErrorCallback;
  options: TJSRTCOfferOptions): TJSPromise;
begin

end;

function TJSRTCPeerConnection.createOffer(
  successCallback: RTCSessionDescriptionCallback;
  failureCallback: RTCPeerConnectionErrorCallback): TJSPromise;
begin

end;

function TJSRTCPeerConnection.createOffer(
  options: TJSRTCOfferOptions): TJSPromise;
begin

end;

function TJSRTCPeerConnection.createOffer: TJSPromise;
begin

end;

function TJSRTCPeerConnection.generateCertificate(
  keygenAlgorithm: AlgorithmIdentifier): TJSPromise;
begin

end;

function TJSRTCPeerConnection.getConfiguration: TJSRTCConfiguration;
begin

end;

function TJSRTCPeerConnection.getReceivers: TTJSRTCRtpReceiverDynArray;
begin

end;

function TJSRTCPeerConnection.getSenders: TTJSRTCRtpSenderDynArray;
begin

end;

function TJSRTCPeerConnection.getStats(selector: JSValue): TJSPromise;
begin

end;

function TJSRTCPeerConnection.getStats: TJSPromise;
begin

end;

function TJSRTCPeerConnection.getTransceivers: TTJSRTCRtpTransceiverDynArray;
begin

end;

constructor TJSRTCPeerConnection.New;
begin

end;

constructor TJSRTCPeerConnection.New(configuration: TJSRTCConfiguration);
begin

end;

procedure TJSRTCPeerConnection.removeTrack(sender: TJSRTCRtpSender);
begin

end;

procedure TJSRTCPeerConnection.restartIce;
begin

end;

procedure TJSRTCPeerConnection.setConfiguration(
  configuration: TJSRTCConfiguration);
begin

end;

function TJSRTCPeerConnection.setLocalDescription: TJSPromise;
begin

end;

function TJSRTCPeerConnection.setLocalDescription(
  description: TJSRTCSessionDescriptionInit): TJSPromise;
begin

end;

function TJSRTCPeerConnection.setRemoteDescription(
  description: TJSRTCSessionDescriptionInit): TJSPromise;
begin

end;

function TJSRTCPeerConnection.setRemoteDescription: TJSPromise;
begin

end;

{ TJSRTCSessionDescription }

constructor TJSRTCSessionDescription.New(
  descriptionInitDict: TJSRTCSessionDescriptionInit);
begin

end;

constructor TJSRTCSessionDescription.New;
begin

end;

function TJSRTCSessionDescription.toJSON: TJSObject;
begin

end;

{ TJSRTCIceCandidate }

constructor TJSRTCIceCandidate.New(candidateInitDict: TJSRTCIceCandidateInit);
begin

end;

constructor TJSRTCIceCandidate.New;
begin

end;

function TJSRTCIceCandidate.toJSON: TJSRTCIceCandidateInit;
begin

end;

{ TJSRTCPeerConnectionIceEvent }

constructor TJSRTCPeerConnectionIceEvent.New(type_: String);
begin

end;

constructor TJSRTCPeerConnectionIceEvent.New(type_: String;
  eventInitDict: TJSRTCPeerConnectionIceEventInit);
begin

end;

{ TJSRTCPeerConnectionIceErrorEvent }

constructor TJSRTCPeerConnectionIceErrorEvent.New(type_: String;
  eventInitDict: TJSRTCPeerConnectionIceErrorEventInit);
begin

end;

{ TJSRTCCertificate }

function TJSRTCCertificate.getFingerprints: TTJSRTCDtlsFingerprintDynArray;
begin

end;

{ TJSRTCRtpSender }

function TJSRTCRtpSender.getCapabilities(kind: String): TJSRTCRtpCapabilities;
begin

end;

function TJSRTCRtpSender.getParameters: TJSRTCRtpSendParameters;
begin

end;

function TJSRTCRtpSender.getStats: TJSPromise;
begin

end;

function TJSRTCRtpSender.replaceTrack(withTrack: JSValue): TJSPromise;
begin

end;

function TJSRTCRtpSender.setParameters(
  parameters: TJSRTCRtpSendParameters): TJSPromise;
begin

end;

procedure TJSRTCRtpSender.setStreams(streams: TJSHTMLMediaStream);
begin

end;

{ TJSRTCRtpReceiver }

function TJSRTCRtpReceiver.getCapabilities(kind: String): TJSRTCRtpCapabilities;
begin

end;

function TJSRTCRtpReceiver.getContributingSources: TTJSRTCRtpContributingSourceDynArray;
begin

end;

function TJSRTCRtpReceiver.getParameters: TJSRTCRtpReceiveParameters;
begin

end;

function TJSRTCRtpReceiver.getStats: TJSPromise;
begin

end;

function TJSRTCRtpReceiver.getSynchronizationSources: TTJSRTCRtpSynchronizationSourceDynArray;
begin

end;

{ TJSRTCRtpTransceiver }

procedure TJSRTCRtpTransceiver.setCodecPreferences(
  codecs: TTJSRTCRtpCodecCapabilityDynArray);
begin

end;

procedure TJSRTCRtpTransceiver.stop;
begin

end;

{ TJSRTCDtlsTransport }

function TJSRTCDtlsTransport.getRemoteCertificates: TTJSArrayBufferDynArray;
begin

end;

{ TJSRTCIceTransport }

function TJSRTCIceTransport.getLocalCandidates: TTJSRTCIceCandidateDynArray;
begin

end;

function TJSRTCIceTransport.getLocalParameters: TJSRTCIceParameters;
begin

end;

function TJSRTCIceTransport.getRemoteCandidates: TTJSRTCIceCandidateDynArray;
begin

end;

function TJSRTCIceTransport.getRemoteParameters: TJSRTCIceParameters;
begin

end;

function TJSRTCIceTransport.getSelectedCandidatePair: TJSRTCIceCandidatePair;
begin

end;

{ TJSRTCTrackEvent }

constructor TJSRTCTrackEvent.New(type_: String;
  eventInitDict: TJSRTCTrackEventInit);
begin

end;

{ TJSRTCDataChannel }

procedure TJSRTCDataChannel.close;
begin

end;

procedure TJSRTCDataChannel.send(data: String);
begin

end;

procedure TJSRTCDataChannel.send(data: TJSBlob);
begin

end;

procedure TJSRTCDataChannel.send(data: TJSArrayBuffer);
begin

end;

procedure TJSRTCDataChannel.send(data: TJSTypedArray);
begin

end;

{ TJSRTCDataChannelEvent }

constructor TJSRTCDataChannelEvent.New(type_: String;
  eventInitDict: TJSRTCDataChannelEventInit);
begin

end;

{ TJSRTCDTMFSender }

procedure TJSRTCDTMFSender.insertDTMF(tones: String; duration,
  interToneGap: NativeInt);
begin

end;

procedure TJSRTCDTMFSender.insertDTMF(tones: String);
begin

end;

procedure TJSRTCDTMFSender.insertDTMF(tones: String; duration: NativeInt);
begin

end;

{ TJSRTCDTMFToneChangeEvent }

constructor TJSRTCDTMFToneChangeEvent.New(type_: String;
  eventInitDict: TJSRTCDTMFToneChangeEventInit);
begin

end;

{ TJSRTCError }

constructor TJSRTCError.New(init: TJSRTCErrorInit);
begin

end;

constructor TJSRTCError.New(init: TJSRTCErrorInit; message: String);
begin

end;

{ TJSRTCErrorEvent }

constructor TJSRTCErrorEvent.New(type_: String;
  eventInitDict: TJSRTCErrorEventInit);
begin

end;
{$ENDIF}
end.
