Unit webaudio;

{$IFDEF PAS2JS}
{$MODE ObjFPC}
{$H+}
{$modeswitch externalclass}
{$ENDIF}

interface

uses SysUtils, JS,web,types;

{
  Automatically generated file by TWebIDLToPas on 2018-06-23 10:52:00
  
  Used command-line options : 
  -i
  webaudio.idl
  -v
  v2
  -t
  EventTarget=TJSEventTarget,DOMHighResTimeStamp=TJSDOMHighResTimeStamp,HTMLMediaElement=TJSElement,MediaStream=JSValue,MediaStreamTrack=JSValue,EventHandler=TJSEVentHandler,Promise=TJSPromise,Event=TJSEvent,Worklet=TJSOBject,WorkletGlobalScope=TJSObject,VoidFunction=TProcedure,MessagePort=TJSMessagePort
  -x
  web,types
  -d
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
  EventTarget=TJSEventTarget
  DOMHighResTimeStamp=TJSDOMHighResTimeStamp
  HTMLMediaElement=TJSElement
  MediaStream=JSValue
  MediaStreamTrack=JSValue
  EventHandler=TJSEVentHandler
  Promise=TJSPromise
  Event=TJSEvent
  Worklet=TJSOBject
  WorkletGlobalScope=TJSObject
  VoidFunction=TProcedure
  MessagePort=TJSMessagePort
}
Type
  // Forward class definitions
  TJSBaseAudioContext = Class;
  TJSAudioContext = Class;
  TJSOfflineAudioContext = Class;
  TJSOfflineAudioCompletionEvent = Class;
  TJSAudioBuffer = Class;
  TJSAudioNode = Class;
  TJSAudioParam = Class;
  TJSAudioScheduledSourceNode = Class;
  TJSAnalyserNode = Class;
  TJSAudioBufferSourceNode = Class;
  TJSAudioDestinationNode = Class;
  TJSAudioListener = Class;
  TJSAudioProcessingEvent = Class;
  TJSBiquadFilterNode = Class;
  TJSChannelMergerNode = Class;
  TJSChannelSplitterNode = Class;
  TJSConstantSourceNode = Class;
  TJSConvolverNode = Class;
  TJSDelayNode = Class;
  TJSDynamicsCompressorNode = Class;
  TJSGainNode = Class;
  TJSIIRFilterNode = Class;
  TJSMediaElementAudioSourceNode = Class;
  TJSMediaStreamAudioDestinationNode = Class;
  TJSMediaStreamAudioSourceNode = Class;
  TJSMediaStreamTrackAudioSourceNode = Class;
  TJSOscillatorNode = Class;
  TJSPannerNode = Class;
  TJSPeriodicWave = Class;
  TJSScriptProcessorNode = Class;
  TJSStereoPannerNode = Class;
  TJSWaveShaperNode = Class;
  TJSAudioWorklet = Class;
  TJSAudioWorkletGlobalScope = Class;
  TJSAudioParamMap = Class;
  TJSAudioWorkletNode = Class;
  TJSAudioWorkletProcessor = Class;
  TJSAudioContextOptions = Class;
  TJSAudioTimestamp = Class;
  TJSOfflineAudioContextOptions = Class;
  TJSOfflineAudioCompletionEventInit = Class;
  TJSAudioBufferOptions = Class;
  TJSAudioNodeOptions = Class;
  TJSAnalyserOptions = Class;
  TJSAudioBufferSourceOptions = Class;
  TJSAudioProcessingEventInit = Class;
  TJSBiquadFilterOptions = Class;
  TJSChannelMergerOptions = Class;
  TJSChannelSplitterOptions = Class;
  TJSConstantSourceOptions = Class;
  TJSConvolverOptions = Class;
  TJSDelayOptions = Class;
  TJSDynamicsCompressorOptions = Class;
  TJSGainOptions = Class;
  TJSIIRFilterOptions = Class;
  TJSMediaElementAudioSourceOptions = Class;
  TJSMediaStreamAudioSourceOptions = Class;
  TJSMediaStreamTrackAudioSourceOptions = Class;
  TJSOscillatorOptions = Class;
  TJSPannerOptions = Class;
  TJSPeriodicWaveConstraints = Class;
  TJSPeriodicWaveOptions = Class;
  TJSStereoPannerOptions = Class;
  TJSWaveShaperOptions = Class;
  TJSAudioWorkletNodeOptions = Class;
  TJSAudioParamDescriptor = Class;
  AudioContextState = String;
  AudioContextLatencyCategory = String;
  ChannelCountMode = String;
  ChannelInterpretation = String;
  AutomationRate = String;
  BiquadFilterType = String;
  OscillatorType = String;
  PanningModelType = String;
  DistanceModelType = String;
  OverSampleType = String;
  DecodeErrorCallback = Procedure (error : TJSError);
  DecodeSuccessCallback = Procedure (decodedData : TJSAudioBuffer);
  
  { --------------------------------------------------------------------
    TJSAudioContextOptions
    --------------------------------------------------------------------}
  
  TJSAudioContextOptions = class(TJSObject)
    latencyHint : JSValue;
    sampleRate : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSAudioTimestamp
    --------------------------------------------------------------------}
  
  TJSAudioTimestamp = class(TJSObject)
    contextTime : Double;
    performanceTime : TJSDOMHighResTimeStamp;
  end;
  
  { --------------------------------------------------------------------
    TJSOfflineAudioContextOptions
    --------------------------------------------------------------------}
  
  TJSOfflineAudioContextOptions = class(TJSObject)
    numberOfChannels : NativeInt;
    length_ : NativeInt; {$IFDEF PAS2JS}external name 'length';{$ENDIF}
    sampleRate : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSOfflineAudioCompletionEventInit
    --------------------------------------------------------------------}
  
  TJSOfflineAudioCompletionEventInit = class(TJSObject)
    renderedBuffer : TJSAudioBuffer;
  end;
  
  { --------------------------------------------------------------------
    TJSAudioBufferOptions
    --------------------------------------------------------------------}
  
  TJSAudioBufferOptions = class(TJSObject)
    numberOfChannels : NativeInt;
    length_ : NativeInt; {$IFDEF PAS2JS}external name 'length';{$ENDIF}
    sampleRate : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSAudioNodeOptions
    --------------------------------------------------------------------}
  
  TJSAudioNodeOptions = class(TJSObject)
    channelCount : NativeInt;
    _channelCountMode : ChannelCountMode; {$IFDEF PAS2JS}external name 'channelCountMode';{$ENDIF}
    _channelInterpretation : ChannelInterpretation; {$IFDEF PAS2JS}external name 'channelInterpretation';{$ENDIF}
  end;

  { --------------------------------------------------------------------
    TJSAnalyserOptions
    --------------------------------------------------------------------}
  
  TJSAnalyserOptions = class(TJSObject)
    fftSize : NativeInt;
    maxDecibels : Double;
    minDecibels : Double;
    smoothingTimeConstant : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSAudioBufferSourceOptions
    --------------------------------------------------------------------}
  
  TJSAudioBufferSourceOptions = class(TJSObject)
    buffer : TJSAudioBuffer;
    detune : Double;
    loop : boolean;
    loopEnd : Double;
    loopStart : Double;
    playbackRate : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSAudioProcessingEventInit
    --------------------------------------------------------------------}
  
  TJSAudioProcessingEventInit = class(TJSObject)
    playbackTime : Double;
    inputBuffer : TJSAudioBuffer;
    outputBuffer : TJSAudioBuffer;
  end;
  
  { --------------------------------------------------------------------
    TJSBiquadFilterOptions
    --------------------------------------------------------------------}
  
  TJSBiquadFilterOptions = class(TJSObject)
    type_ : BiquadFilterType; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    Q : Double;
    detune : Double;
    frequency : Double;
    gain : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSChannelMergerOptions
    --------------------------------------------------------------------}
  
  TJSChannelMergerOptions = class(TJSObject)
    numberOfInputs : NativeInt;
  end;
  
  { --------------------------------------------------------------------
    TJSChannelSplitterOptions
    --------------------------------------------------------------------}
  
  TJSChannelSplitterOptions = class(TJSObject)
    numberOfOutputs : NativeInt;
  end;
  
  { --------------------------------------------------------------------
    TJSConstantSourceOptions
    --------------------------------------------------------------------}
  
  TJSConstantSourceOptions = class(TJSObject)
    offset : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSConvolverOptions
    --------------------------------------------------------------------}
  
  TJSConvolverOptions = class(TJSObject)
    buffer : TJSAudioBuffer;
    disableNormalization : boolean;
  end;
  
  { --------------------------------------------------------------------
    TJSDelayOptions
    --------------------------------------------------------------------}
  
  TJSDelayOptions = class(TJSObject)
    maxDelayTime : Double;
    delayTime : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSDynamicsCompressorOptions
    --------------------------------------------------------------------}
  
  TJSDynamicsCompressorOptions = class(TJSObject)
    attack : Double;
    knee : Double;
    ratio : Double;
    release : Double;
    threshold : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSGainOptions
    --------------------------------------------------------------------}
  
  TJSGainOptions = class(TJSObject)
    gain : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSIIRFilterOptions
    --------------------------------------------------------------------}
  
  TJSIIRFilterOptions = class(TJSObject)
    feedforward : TDoubleDynArray;
    feedback : TDoubleDynArray;
  end;
  
  { --------------------------------------------------------------------
    TJSMediaElementAudioSourceOptions
    --------------------------------------------------------------------}
  
  TJSMediaElementAudioSourceOptions = class(TJSObject)
    mediaElement : TJSElement;
  end;
  
  { --------------------------------------------------------------------
    TJSMediaStreamAudioSourceOptions
    --------------------------------------------------------------------}
  
  TJSMediaStreamAudioSourceOptions = class(TJSObject)
    mediaStream : JSValue;
  end;
  
  { --------------------------------------------------------------------
    TJSMediaStreamTrackAudioSourceOptions
    --------------------------------------------------------------------}
  
  TJSMediaStreamTrackAudioSourceOptions = class(TJSObject)
    mediaStreamTrack : JSValue;
  end;
  
  { --------------------------------------------------------------------
    TJSOscillatorOptions
    --------------------------------------------------------------------}
  
  TJSOscillatorOptions = class(TJSObject)
    type_ : OscillatorType; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    frequency : Double;
    detune : Double;
    periodicWave : TJSPeriodicWave;
  end;
  
  { --------------------------------------------------------------------
    TJSPannerOptions
    --------------------------------------------------------------------}
  
  TJSPannerOptions = class(TJSObject)
    panningModel : PanningModelType;
    distanceModel : DistanceModelType;
    positionX : Double;
    positionY : Double;
    positionZ : Double;
    orientationX : Double;
    orientationY : Double;
    orientationZ : Double;
    refDistance : Double;
    maxDistance : Double;
    rolloffFactor : Double;
    coneInnerAngle : Double;
    coneOuterAngle : Double;
    coneOuterGain : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSPeriodicWaveConstraints
    --------------------------------------------------------------------}
  
  TJSPeriodicWaveConstraints = class(TJSObject)
    disableNormalization : boolean;
  end;
  
  { --------------------------------------------------------------------
    TJSPeriodicWaveOptions
    --------------------------------------------------------------------}
  
  TJSPeriodicWaveOptions = class(TJSObject)
    real : TDoubleDynArray;
    imag : TDoubleDynArray;
  end;
  
  { --------------------------------------------------------------------
    TJSStereoPannerOptions
    --------------------------------------------------------------------}
  
  TJSStereoPannerOptions = class(TJSObject)
    pan : Double;
  end;
  
  { --------------------------------------------------------------------
    TJSWaveShaperOptions
    --------------------------------------------------------------------}
  
  TJSWaveShaperOptions = class(TJSObject)
    curve : TDoubleDynArray;
    oversample : OverSampleType;
  end;
  
  { --------------------------------------------------------------------
    TJSAudioWorkletNodeOptions
    --------------------------------------------------------------------}
  
  TJSAudioWorkletNodeOptions = class(TJSObject)
    numberOfInputs : NativeInt;
    numberOfOutputs : NativeInt;
    outputChannelCount : TNativeIntDynArray;
    parameterData : TJSObject;
    processorOptions : TJSObject;
  end;
  
  { --------------------------------------------------------------------
    TJSAudioParamDescriptor
    --------------------------------------------------------------------}
  
  TJSAudioParamDescriptor = class(TJSObject)
    name : String;
    defaultValue : Double;
    minValue : Double;
    maxValue : Double;
    _automationRate : AutomationRate; {$IFDEF PAS2JS}external name 'automationRate';{$ENDIF}
  end;

  { --------------------------------------------------------------------
    TJSBaseAudioContext
    --------------------------------------------------------------------}
  
  TDoubleDynArray = Array of Double;
  
  TJSBaseAudioContext = class {$IFDEF PAS2JS}external name 'BaseAudioContext'{$ENDIF} (TJSEventTarget)
  Private
    Fdestination : TJSAudioDestinationNode; {$IFDEF PAS2JS}external name 'destination';{$ENDIF}
    FsampleRate : Double; {$IFDEF PAS2JS}external name 'sampleRate';{$ENDIF}
    FcurrentTime : Double; {$IFDEF PAS2JS}external name 'currentTime';{$ENDIF}
    Flistener : TJSAudioListener; {$IFDEF PAS2JS}external name 'listener';{$ENDIF}
    Fstate : AudioContextState; {$IFDEF PAS2JS}external name 'state';{$ENDIF}
    FaudioWorklet : TJSAudioWorklet; {$IFDEF PAS2JS}external name 'audioWorklet';{$ENDIF}
  Public
    
      onstatechange : TJSEVentHandler;
    function createAnalyser: TJSAnalyserNode;
    function createBiquadFilter: TJSBiquadFilterNode;
    function createBuffer(numberOfChannels : NativeInt; length_ : NativeInt; sampleRate : Double): TJSAudioBuffer;
    function createBufferSource: TJSAudioBufferSourceNode;
    function createChannelMerger(numberOfInputs : NativeInt): TJSChannelMergerNode; overload;
    function createChannelMerger: TJSChannelMergerNode; overload;
    function createChannelSplitter(numberOfOutputs : NativeInt): TJSChannelSplitterNode; overload;
    function createChannelSplitter: TJSChannelSplitterNode; overload;
    function createConstantSource: TJSConstantSourceNode;
    function createConvolver: TJSConvolverNode;
    function createDelay(maxDelayTime : Double): TJSDelayNode; overload;
    function createDelay: TJSDelayNode; overload;
    function createDynamicsCompressor: TJSDynamicsCompressorNode;
    function createGain: TJSGainNode;
    function createIIRFilter(feedforward : TDoubleDynArray; feedback : TDoubleDynArray): TJSIIRFilterNode;
    function createOscillator: TJSOscillatorNode;
    function createPanner: TJSPannerNode;
    function createPeriodicWave(real : TDoubleDynArray; imag : TDoubleDynArray; constraints : TJSPeriodicWaveConstraints): TJSPeriodicWave; overload;
    function createPeriodicWave(real : TDoubleDynArray; imag : TDoubleDynArray): TJSPeriodicWave; overload;
    function createScriptProcessor(bufferSize : NativeInt; numberOfInputChannels : NativeInt; numberOfOutputChannels : NativeInt): TJSScriptProcessorNode; overload;
    function createScriptProcessor: TJSScriptProcessorNode; overload;
    function createScriptProcessor(bufferSize : NativeInt): TJSScriptProcessorNode; overload;
    function createScriptProcessor(bufferSize : NativeInt; numberOfInputChannels : NativeInt): TJSScriptProcessorNode; overload;
    function createStereoPanner: TJSStereoPannerNode;
    function createWaveShaper: TJSWaveShaperNode;
    function decodeAudioData(audioData : TJSArrayBuffer; successCallback : DecodeSuccessCallback; errorCallback : DecodeErrorCallback): TJSPromise; overload;
    function decodeAudioData(audioData : TJSArrayBuffer): TJSPromise; overload;
    function decodeAudioData(audioData : TJSArrayBuffer; successCallback : DecodeSuccessCallback): TJSPromise; overload;
    function resume: TJSPromise;
    Property destination : TJSAudioDestinationNode Read Fdestination; 
    Property sampleRate : Double Read FsampleRate; 
    Property currentTime : Double Read FcurrentTime; 
    Property listener : TJSAudioListener Read Flistener; 
    Property state : AudioContextState Read Fstate; 
    Property audioWorklet : TJSAudioWorklet Read FaudioWorklet; 
  end;
  
  { --------------------------------------------------------------------
    TJSAudioContext
    --------------------------------------------------------------------}
  
  TJSAudioContext = class {$IFDEF PAS2JS}external name 'AudioContext'{$ENDIF} (TJSBaseAudioContext)
  Private
    FbaseLatency : Double; {$IFDEF PAS2JS}external name 'baseLatency';{$ENDIF}
    FoutputLatency : Double; {$IFDEF PAS2JS}external name 'outputLatency';{$ENDIF}
  Public
    function getOutputTimestamp: TJSAudioTimestamp;
    function suspend: TJSPromise;
    function close: TJSPromise;
    function createMediaElementSource(mediaElement : TJSElement): TJSMediaElementAudioSourceNode;
    function createMediaStreamSource(mediaStream : JSValue): TJSMediaStreamAudioSourceNode;
    function createMediaStreamTrackSource(mediaStreamTrack : JSValue): TJSMediaStreamTrackAudioSourceNode;
    function createMediaStreamDestination: TJSMediaStreamAudioDestinationNode;
    Property baseLatency : Double Read FbaseLatency; 
    Property outputLatency : Double Read FoutputLatency; 
  end;
  
  { --------------------------------------------------------------------
    TJSOfflineAudioContext
    --------------------------------------------------------------------}
  
  TJSOfflineAudioContext = class {$IFDEF PAS2JS}external name 'OfflineAudioContext'{$ENDIF} (TJSBaseAudioContext)
  Private
    Flength_ : NativeInt; {$IFDEF PAS2JS}external name 'length';{$ENDIF}
  Public
      oncomplete : TJSEVentHandler;
    function startRendering: TJSPromise;
    function suspend(suspendTime : Double): TJSPromise;
    Property length_ : NativeInt Read Flength_; 
  end;
  
  { --------------------------------------------------------------------
    TJSOfflineAudioCompletionEvent
    --------------------------------------------------------------------}
  
  TJSOfflineAudioCompletionEvent = class {$IFDEF PAS2JS}external name 'OfflineAudioCompletionEvent'{$ENDIF} (TJSEvent)
  Private
    FrenderedBuffer : TJSAudioBuffer; {$IFDEF PAS2JS}external name 'renderedBuffer';{$ENDIF}
  Public
    Property renderedBuffer : TJSAudioBuffer Read FrenderedBuffer; 
  end;

  { --------------------------------------------------------------------
    TJSAudioBuffer
    --------------------------------------------------------------------}

  TJSAudioBuffer = class {$IFDEF PAS2JS}external name 'AudioBuffer'{$ENDIF}
  Private
    FsampleRate : Double; {$IFDEF PAS2JS}external name 'sampleRate';{$ENDIF}
    Flength_ : NativeInt; {$IFDEF PAS2JS}external name 'length';{$ENDIF}
    Fduration : Double; {$IFDEF PAS2JS}external name 'duration';{$ENDIF}
    FnumberOfChannels : NativeInt; {$IFDEF PAS2JS}external name 'numberOfChannels';{$ENDIF}
  Public
    function getChannelData(channel : NativeInt): TJSFloat32Array;
    Procedure copyFromChannel(destination : TJSFloat32Array; channelNumber : NativeInt; startInChannel : NativeInt); overload;
    Procedure copyFromChannel(destination : TJSFloat32Array; channelNumber : NativeInt); overload;
    Procedure copyToChannel(source : TJSFloat32Array; channelNumber : NativeInt; startInChannel : NativeInt); overload;
    Procedure copyToChannel(source : TJSFloat32Array; channelNumber : NativeInt); overload;
    Property sampleRate : Double Read FsampleRate; 
    Property length_ : NativeInt Read Flength_; 
    Property duration : Double Read Fduration; 
    Property numberOfChannels : NativeInt Read FnumberOfChannels; 
  end;
  
  { --------------------------------------------------------------------
    TJSAudioNode
    --------------------------------------------------------------------}
  
  TJSAudioNode = class {$IFDEF PAS2JS}external name 'AudioNode'{$ENDIF} (TJSEventTarget)
  Private
    Fcontext : TJSBaseAudioContext; {$IFDEF PAS2JS}external name 'context';{$ENDIF}
    FnumberOfInputs : NativeInt; {$IFDEF PAS2JS}external name 'numberOfInputs';{$ENDIF}
    FnumberOfOutputs : NativeInt; {$IFDEF PAS2JS}external name 'numberOfOutputs';{$ENDIF}
  Public
      channelCount : NativeInt;
      _channelCountMode : ChannelCountMode; {$IFDEF PAS2JS}external name 'channelCountMode';{$ENDIF}
      _channelInterpretation : ChannelInterpretation; {$IFDEF PAS2JS}external name 'channelInterpretation';{$ENDIF}
    function connect(destinationNode : TJSAudioNode; output : NativeInt; input : NativeInt): TJSAudioNode; overload;
    function connect(destinationNode : TJSAudioNode): TJSAudioNode; overload;
    function connect(destinationNode : TJSAudioNode; output : NativeInt): TJSAudioNode; overload;
    Procedure connect(destinationParam : TJSAudioParam; output : NativeInt); overload;
    Procedure connect(destinationParam : TJSAudioParam); overload;
    Procedure disconnect; overload;
    Procedure disconnect(output : NativeInt); overload;
    Procedure disconnect(destinationNode : TJSAudioNode); overload;
    Procedure disconnect(destinationNode : TJSAudioNode; output : NativeInt); overload;
    Procedure disconnect(destinationNode : TJSAudioNode; output : NativeInt; input : NativeInt); overload;
    Procedure disconnect(destinationParam : TJSAudioParam); overload;
    Procedure disconnect(destinationParam : TJSAudioParam; output : NativeInt); overload;
    Property context : TJSBaseAudioContext Read Fcontext; 
    Property numberOfInputs : NativeInt Read FnumberOfInputs; 
    Property numberOfOutputs : NativeInt Read FnumberOfOutputs; 
  end;
  
  { --------------------------------------------------------------------
    TJSAudioParam
    --------------------------------------------------------------------}
  
  TJSAudioParam = class {$IFDEF PAS2JS}external name 'AudioParam'{$ENDIF}
  Private
    FdefaultValue : Double; {$IFDEF PAS2JS}external name 'defaultValue';{$ENDIF}
    FminValue : Double; {$IFDEF PAS2JS}external name 'minValue';{$ENDIF}
    FmaxValue : Double; {$IFDEF PAS2JS}external name 'maxValue';{$ENDIF}
  Public
      value : Double;
      _automationRate : AutomationRate; {$IFDEF PAS2JS}external name 'automationRate';{$ENDIF}
    function setValueAtTime(value : Double; startTime : Double): TJSAudioParam;
    function linearRampToValueAtTime(value : Double; endTime : Double): TJSAudioParam;
    function exponentialRampToValueAtTime(value : Double; endTime : Double): TJSAudioParam;
    function setTargetAtTime(target : Double; startTime : Double; timeConstant : Double): TJSAudioParam;
    function setValueCurveAtTime(values : TDoubleDynArray; startTime : Double; duration : Double): TJSAudioParam;
    function cancelScheduledValues(cancelTime : Double): TJSAudioParam;
    function cancelAndHoldAtTime(cancelTime : Double): TJSAudioParam;
    Property defaultValue : Double Read FdefaultValue; 
    Property minValue : Double Read FminValue; 
    Property maxValue : Double Read FmaxValue; 
  end;
  
  { --------------------------------------------------------------------
    TJSAudioScheduledSourceNode
    --------------------------------------------------------------------}
  
  TJSAudioScheduledSourceNode = class {$IFDEF PAS2JS}external name 'AudioScheduledSourceNode'{$ENDIF} (TJSAudioNode)
  Private
  Public
      onended : TJSEVentHandler;
    Procedure start(when : Double); overload;
    Procedure start; overload;
    Procedure stop(when : Double); overload;
    Procedure stop; overload;
  end;
  
  { --------------------------------------------------------------------
    TJSAnalyserNode
    --------------------------------------------------------------------}
  
  TJSAnalyserNode = class {$IFDEF PAS2JS}external name 'AnalyserNode'{$ENDIF} (TJSAudioNode)
  Private
    FfrequencyBinCount : NativeInt; {$IFDEF PAS2JS}external name 'frequencyBinCount';{$ENDIF}
  Public
      fftSize : NativeInt;
      minDecibels : Double;
      maxDecibels : Double;
      smoothingTimeConstant : Double;
    Procedure getFloatFrequencyData(array_ : TJSFloat32Array);
    Procedure getByteFrequencyData(array_ : TJSUint8Array);
    Procedure getFloatTimeDomainData(array_ : TJSFloat32Array);
    Procedure getByteTimeDomainData(array_ : TJSUint8Array);
    Property frequencyBinCount : NativeInt Read FfrequencyBinCount; 
  end;
  
  { --------------------------------------------------------------------
    TJSAudioBufferSourceNode
    --------------------------------------------------------------------}
  
  TJSAudioBufferSourceNode = class {$IFDEF PAS2JS}external name 'AudioBufferSourceNode'{$ENDIF} (TJSAudioScheduledSourceNode)
  Private
    FplaybackRate : TJSAudioParam; {$IFDEF PAS2JS}external name 'playbackRate';{$ENDIF}
    Fdetune : TJSAudioParam; {$IFDEF PAS2JS}external name 'detune';{$ENDIF}
  Public
      buffer : TJSAudioBuffer;
      loop : boolean;
      loopStart : Double;
      loopEnd : Double;
    Procedure start(when : Double; offset : Double; duration : Double); overload;
    Procedure start; overload;
    Procedure start(when : Double); overload;
    Procedure start(when : Double; offset : Double); overload;
    Property playbackRate : TJSAudioParam Read FplaybackRate; 
    Property detune : TJSAudioParam Read Fdetune; 
  end;
  
  { --------------------------------------------------------------------
    TJSAudioDestinationNode
    --------------------------------------------------------------------}
  
  TJSAudioDestinationNode = class {$IFDEF PAS2JS}external name 'AudioDestinationNode'{$ENDIF} (TJSAudioNode)
  Private
    FmaxChannelCount : NativeInt; {$IFDEF PAS2JS}external name 'maxChannelCount';{$ENDIF}
  Public
    Property maxChannelCount : NativeInt Read FmaxChannelCount;
  end;
  
  { --------------------------------------------------------------------
    TJSAudioListener
    --------------------------------------------------------------------}
  
  TJSAudioListener = class {$IFDEF PAS2JS}external name 'AudioListener'{$ENDIF}
  Private
    FpositionX : TJSAudioParam; {$IFDEF PAS2JS}external name 'positionX';{$ENDIF}
    FpositionY : TJSAudioParam; {$IFDEF PAS2JS}external name 'positionY';{$ENDIF}
    FpositionZ : TJSAudioParam; {$IFDEF PAS2JS}external name 'positionZ';{$ENDIF}
    FforwardX : TJSAudioParam; {$IFDEF PAS2JS}external name 'forwardX';{$ENDIF}
    FforwardY : TJSAudioParam; {$IFDEF PAS2JS}external name 'forwardY';{$ENDIF}
    FforwardZ : TJSAudioParam; {$IFDEF PAS2JS}external name 'forwardZ';{$ENDIF}
    FupX : TJSAudioParam; {$IFDEF PAS2JS}external name 'upX';{$ENDIF}
    FupY : TJSAudioParam; {$IFDEF PAS2JS}external name 'upY';{$ENDIF}
    FupZ : TJSAudioParam; {$IFDEF PAS2JS}external name 'upZ';{$ENDIF}
  Public
    Procedure setPosition(x : Double; y : Double; z : Double);
    Procedure setOrientation(x : Double; y : Double; z : Double; xUp : Double; yUp : Double; zUp : Double);
    Property positionX : TJSAudioParam Read FpositionX; 
    Property positionY : TJSAudioParam Read FpositionY; 
    Property positionZ : TJSAudioParam Read FpositionZ; 
    Property forwardX : TJSAudioParam Read FforwardX;
    Property forwardY : TJSAudioParam Read FforwardY; 
    Property forwardZ : TJSAudioParam Read FforwardZ;
    Property upX : TJSAudioParam Read FupX; 
    Property upY : TJSAudioParam Read FupY; 
    Property upZ : TJSAudioParam Read FupZ; 
  end;

  { --------------------------------------------------------------------
    TJSAudioProcessingEvent
    --------------------------------------------------------------------}
  
  TJSAudioProcessingEvent = class {$IFDEF PAS2JS}external name 'AudioProcessingEvent'{$ENDIF} (TJSEvent)
  Private
    FplaybackTime : Double; {$IFDEF PAS2JS}external name 'playbackTime';{$ENDIF}
    FinputBuffer : TJSAudioBuffer; {$IFDEF PAS2JS}external name 'inputBuffer';{$ENDIF}
    FoutputBuffer : TJSAudioBuffer; {$IFDEF PAS2JS}external name 'outputBuffer';{$ENDIF}
  Public
    Property playbackTime : Double Read FplaybackTime; 
    Property inputBuffer : TJSAudioBuffer Read FinputBuffer; 
    Property outputBuffer : TJSAudioBuffer Read FoutputBuffer; 
  end;
  
  { --------------------------------------------------------------------
    TJSBiquadFilterNode
    --------------------------------------------------------------------}
  
  TJSBiquadFilterNode = class {$IFDEF PAS2JS}external name 'BiquadFilterNode'{$ENDIF} (TJSAudioNode)
  Private
    Ffrequency : TJSAudioParam; {$IFDEF PAS2JS}external name 'frequency';{$ENDIF}
    Fdetune : TJSAudioParam; {$IFDEF PAS2JS}external name 'detune';{$ENDIF}
    FQ : TJSAudioParam; {$IFDEF PAS2JS}external name 'Q';{$ENDIF}
    Fgain : TJSAudioParam; {$IFDEF PAS2JS}external name 'gain';{$ENDIF}
  Public
      type_ : BiquadFilterType; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    Procedure getFrequencyResponse(frequencyHz : TJSFloat32Array; magResponse : TJSFloat32Array; phaseResponse : TJSFloat32Array);
    Property frequency : TJSAudioParam Read Ffrequency; 
    Property detune : TJSAudioParam Read Fdetune; 
    Property Q : TJSAudioParam Read FQ; 
    Property gain : TJSAudioParam Read Fgain; 
  end;
  
  { --------------------------------------------------------------------
    TJSChannelMergerNode
    --------------------------------------------------------------------}
  
  TJSChannelMergerNode = class {$IFDEF PAS2JS}external name 'ChannelMergerNode'{$ENDIF} (TJSAudioNode)
  Private
  Public
  end;

  { --------------------------------------------------------------------
    TJSChannelSplitterNode
    --------------------------------------------------------------------}
  
  TJSChannelSplitterNode = class {$IFDEF PAS2JS}external name 'ChannelSplitterNode'{$ENDIF} (TJSAudioNode)
  Private
  Public
  end;
  
  { --------------------------------------------------------------------
    TJSConstantSourceNode
    --------------------------------------------------------------------}
  
  TJSConstantSourceNode = class {$IFDEF PAS2JS}external name 'ConstantSourceNode'{$ENDIF} (TJSAudioScheduledSourceNode)
  Private
    Foffset : TJSAudioParam; {$IFDEF PAS2JS}external name 'offset';{$ENDIF}
  Public
    Property offset : TJSAudioParam Read Foffset;
  end;
  
  { --------------------------------------------------------------------
    TJSConvolverNode
    --------------------------------------------------------------------}
  
  TJSConvolverNode = class {$IFDEF PAS2JS}external name 'ConvolverNode'{$ENDIF} (TJSAudioNode)
  Private
  Public
      buffer : TJSAudioBuffer;
      normalize : boolean;
  end;
  
  { --------------------------------------------------------------------
    TJSDelayNode
    --------------------------------------------------------------------}
  
  TJSDelayNode = class {$IFDEF PAS2JS}external name 'DelayNode'{$ENDIF} (TJSAudioNode)
  Private
    FdelayTime : TJSAudioParam; {$IFDEF PAS2JS}external name 'delayTime';{$ENDIF}
  Public
    Property delayTime : TJSAudioParam Read FdelayTime; 
  end;

  { --------------------------------------------------------------------
    TJSDynamicsCompressorNode
    --------------------------------------------------------------------}
  
  TJSDynamicsCompressorNode = class {$IFDEF PAS2JS}external name 'DynamicsCompressorNode'{$ENDIF} (TJSAudioNode)
  Private
    Fthreshold : TJSAudioParam; {$IFDEF PAS2JS}external name 'threshold';{$ENDIF}
    Fknee : TJSAudioParam; {$IFDEF PAS2JS}external name 'knee';{$ENDIF}
    Fratio : TJSAudioParam; {$IFDEF PAS2JS}external name 'ratio';{$ENDIF}
    Freduction : Double; {$IFDEF PAS2JS}external name 'reduction';{$ENDIF}
    Fattack : TJSAudioParam; {$IFDEF PAS2JS}external name 'attack';{$ENDIF}
    Frelease : TJSAudioParam; {$IFDEF PAS2JS}external name 'release';{$ENDIF}
  Public
    Property threshold : TJSAudioParam Read Fthreshold;
    Property knee : TJSAudioParam Read Fknee; 
    Property ratio : TJSAudioParam Read Fratio;
    Property reduction : Double Read Freduction; 
    Property attack : TJSAudioParam Read Fattack; 
    Property release : TJSAudioParam Read Frelease;
  end;
  
  { --------------------------------------------------------------------
    TJSGainNode
    --------------------------------------------------------------------}

  TJSGainNode = class {$IFDEF PAS2JS}external name 'GainNode'{$ENDIF} (TJSAudioNode)
  Private
    Fgain : TJSAudioParam; {$IFDEF PAS2JS}external name 'gain';{$ENDIF}
  Public
    Property gain : TJSAudioParam Read Fgain; 
  end;
  
  { --------------------------------------------------------------------
    TJSIIRFilterNode
    --------------------------------------------------------------------}
  
  TJSIIRFilterNode = class {$IFDEF PAS2JS}external name 'IIRFilterNode'{$ENDIF} (TJSAudioNode)
  Private
  Public
    Procedure getFrequencyResponse(frequencyHz : TJSFloat32Array; magResponse : TJSFloat32Array; phaseResponse : TJSFloat32Array);
  end;
  
  { --------------------------------------------------------------------
    TJSMediaElementAudioSourceNode
    --------------------------------------------------------------------}
  
  TJSMediaElementAudioSourceNode = class {$IFDEF PAS2JS}external name 'MediaElementAudioSourceNode'{$ENDIF} (TJSAudioNode)
  Private
    FmediaElement : TJSElement; {$IFDEF PAS2JS}external name 'mediaElement';{$ENDIF}
  Public
    Property mediaElement : TJSElement Read FmediaElement; 
  end;
  
  { --------------------------------------------------------------------
    TJSMediaStreamAudioDestinationNode
    --------------------------------------------------------------------}
  
  TJSMediaStreamAudioDestinationNode = class {$IFDEF PAS2JS}external name 'MediaStreamAudioDestinationNode'{$ENDIF} (TJSAudioNode)
  Private
    Fstream : JSValue; {$IFDEF PAS2JS}external name 'stream';{$ENDIF}
  Public
    Property stream : JSValue Read Fstream; 
  end;
  
  { --------------------------------------------------------------------
    TJSMediaStreamAudioSourceNode
    --------------------------------------------------------------------}
  
  TJSMediaStreamAudioSourceNode = class {$IFDEF PAS2JS}external name 'MediaStreamAudioSourceNode'{$ENDIF} (TJSAudioNode)
  Private
    FmediaStream : JSValue; {$IFDEF PAS2JS}external name 'mediaStream';{$ENDIF}
  Public
    Property mediaStream : JSValue Read FmediaStream;
  end;
  
  { --------------------------------------------------------------------
    TJSMediaStreamTrackAudioSourceNode
    --------------------------------------------------------------------}
  
  TJSMediaStreamTrackAudioSourceNode = class {$IFDEF PAS2JS}external name 'MediaStreamTrackAudioSourceNode'{$ENDIF} (TJSAudioNode)
  Private
  Public
  end;
  
  { --------------------------------------------------------------------
    TJSOscillatorNode
    --------------------------------------------------------------------}
  
  TJSOscillatorNode = class {$IFDEF PAS2JS}external name 'OscillatorNode'{$ENDIF} (TJSAudioScheduledSourceNode)
  Private
    Ffrequency : TJSAudioParam; {$IFDEF PAS2JS}external name 'frequency';{$ENDIF}
    Fdetune : TJSAudioParam; {$IFDEF PAS2JS}external name 'detune';{$ENDIF}
  Public
      type_ : OscillatorType; {$IFDEF PAS2JS}external name 'type';{$ENDIF}
    Procedure setPeriodicWave(periodicWave : TJSPeriodicWave);
    Property frequency : TJSAudioParam Read Ffrequency; 
    Property detune : TJSAudioParam Read Fdetune; 
  end;
  
  { --------------------------------------------------------------------
    TJSPannerNode
    --------------------------------------------------------------------}
  
  TJSPannerNode = class {$IFDEF PAS2JS}external name 'PannerNode'{$ENDIF} (TJSAudioNode)
  Private
    FpositionX : TJSAudioParam; {$IFDEF PAS2JS}external name 'positionX';{$ENDIF}
    FpositionY : TJSAudioParam; {$IFDEF PAS2JS}external name 'positionY';{$ENDIF}
    FpositionZ : TJSAudioParam; {$IFDEF PAS2JS}external name 'positionZ';{$ENDIF}
    ForientationX : TJSAudioParam; {$IFDEF PAS2JS}external name 'orientationX';{$ENDIF}
    ForientationY : TJSAudioParam; {$IFDEF PAS2JS}external name 'orientationY';{$ENDIF}
    ForientationZ : TJSAudioParam; {$IFDEF PAS2JS}external name 'orientationZ';{$ENDIF}
  Public
      panningModel : PanningModelType;
      distanceModel : DistanceModelType;
      refDistance : Double;
      maxDistance : Double;
      rolloffFactor : Double;
      coneInnerAngle : Double;
      coneOuterAngle : Double;
      coneOuterGain : Double;
    Procedure setPosition(x : Double; y : Double; z : Double);
    Procedure setOrientation(x : Double; y : Double; z : Double);
    Property positionX : TJSAudioParam Read FpositionX; 
    Property positionY : TJSAudioParam Read FpositionY; 
    Property positionZ : TJSAudioParam Read FpositionZ; 
    Property orientationX : TJSAudioParam Read ForientationX; 
    Property orientationY : TJSAudioParam Read ForientationY; 
    Property orientationZ : TJSAudioParam Read ForientationZ; 
  end;
  
  { --------------------------------------------------------------------
    TJSPeriodicWave
    --------------------------------------------------------------------}
  
  TJSPeriodicWave = class {$IFDEF PAS2JS}external name 'PeriodicWave'{$ENDIF}
  Private
  Public
  end;
  
  { --------------------------------------------------------------------
    TJSScriptProcessorNode
    --------------------------------------------------------------------}
  
  TJSScriptProcessorNode = class {$IFDEF PAS2JS}external name 'ScriptProcessorNode'{$ENDIF} (TJSAudioNode)
  Private
    FbufferSize : Integer; {$IFDEF PAS2JS}external name 'bufferSize';{$ENDIF}
  Public
      onaudioprocess : TJSEVentHandler;
    Property bufferSize : Integer Read FbufferSize; 
  end;
  
  { --------------------------------------------------------------------
    TJSStereoPannerNode
    --------------------------------------------------------------------}
  
  TJSStereoPannerNode = class {$IFDEF PAS2JS}external name 'StereoPannerNode'{$ENDIF} (TJSAudioNode)
  Private
    Fpan : TJSAudioParam; {$IFDEF PAS2JS}external name 'pan';{$ENDIF}
  Public
    Property pan : TJSAudioParam Read Fpan;
  end;
  
  { --------------------------------------------------------------------
    TJSWaveShaperNode
    --------------------------------------------------------------------}
  
  TJSWaveShaperNode = class {$IFDEF PAS2JS}external name 'WaveShaperNode'{$ENDIF} (TJSAudioNode)
  Private
  Public
      curve : TJSFloat32Array;
      oversample : OverSampleType;
  end;
  
  { --------------------------------------------------------------------
    TJSAudioWorklet
    --------------------------------------------------------------------}

  TJSAudioWorklet = class {$IFDEF PAS2JS}external name 'AudioWorklet'{$ENDIF} (TJSOBject)
  Private
  Public
  end;
  
  { --------------------------------------------------------------------
    TJSAudioWorkletGlobalScope
    --------------------------------------------------------------------}

  TJSAudioWorkletGlobalScope = class {$IFDEF PAS2JS}external name 'AudioWorkletGlobalScope'{$ENDIF} (TJSObject)
  Private
    FcurrentFrame : NativeInt; {$IFDEF PAS2JS}external name 'currentFrame';{$ENDIF}
    FcurrentTime : Double; {$IFDEF PAS2JS}external name 'currentTime';{$ENDIF}
    FsampleRate : Double; {$IFDEF PAS2JS}external name 'sampleRate';{$ENDIF}
  Public
    Procedure registerProcessor(name : String; processorCtor : TProcedure);
    Property currentFrame : NativeInt Read FcurrentFrame; 
    Property currentTime : Double Read FcurrentTime; 
    Property sampleRate : Double Read FsampleRate; 
  end;
  
  { --------------------------------------------------------------------
    TJSAudioParamMap
    --------------------------------------------------------------------}
  
  TJSAudioParamMap = class {$IFDEF PAS2JS}external name 'AudioParamMap'{$ENDIF}
  Private
  Public
  end;
  
  { --------------------------------------------------------------------
    TJSAudioWorkletNode
    --------------------------------------------------------------------}
  
  TJSAudioWorkletNode = class {$IFDEF PAS2JS}external name 'AudioWorkletNode'{$ENDIF} (TJSAudioNode)
  Private
    Fparameters : TJSAudioParamMap; {$IFDEF PAS2JS}external name 'parameters';{$ENDIF}
    Fport : TJSMessagePort; {$IFDEF PAS2JS}external name 'port';{$ENDIF}
  Public
      onprocessorerror : TJSEVentHandler;
    Property parameters : TJSAudioParamMap Read Fparameters; 
    Property port : TJSMessagePort Read Fport;
  end;
  
  { --------------------------------------------------------------------
    TJSAudioWorkletProcessor
    --------------------------------------------------------------------}
  
  TJSAudioWorkletProcessor = class {$IFDEF PAS2JS}external name 'AudioWorkletProcessor'{$ENDIF}
  Private
    Fport : TJSMessagePort; {$IFDEF PAS2JS}external name 'port';{$ENDIF}
  Public
    Property port : TJSMessagePort Read Fport; 
  end;

implementation

{$IFDEF DCC}
{ TJSBaseAudioContext }

function TJSBaseAudioContext.createAnalyser: TJSAnalyserNode;
begin

end;

function TJSBaseAudioContext.createBiquadFilter: TJSBiquadFilterNode;
begin

end;

function TJSBaseAudioContext.createBuffer(numberOfChannels, length_: NativeInt;
  sampleRate: Double): TJSAudioBuffer;
begin

end;

function TJSBaseAudioContext.createBufferSource: TJSAudioBufferSourceNode;
begin

end;

function TJSBaseAudioContext.createChannelMerger: TJSChannelMergerNode;
begin

end;

function TJSBaseAudioContext.createChannelMerger(
  numberOfInputs: NativeInt): TJSChannelMergerNode;
begin

end;

function TJSBaseAudioContext.createChannelSplitter(
  numberOfOutputs: NativeInt): TJSChannelSplitterNode;
begin

end;

function TJSBaseAudioContext.createChannelSplitter: TJSChannelSplitterNode;
begin

end;

function TJSBaseAudioContext.createConstantSource: TJSConstantSourceNode;
begin

end;

function TJSBaseAudioContext.createConvolver: TJSConvolverNode;
begin

end;

function TJSBaseAudioContext.createDelay(maxDelayTime: Double): TJSDelayNode;
begin

end;

function TJSBaseAudioContext.createDelay: TJSDelayNode;
begin

end;

function TJSBaseAudioContext.createDynamicsCompressor: TJSDynamicsCompressorNode;
begin

end;

function TJSBaseAudioContext.createGain: TJSGainNode;
begin

end;

function TJSBaseAudioContext.createIIRFilter(feedforward,
  feedback: TDoubleDynArray): TJSIIRFilterNode;
begin

end;

function TJSBaseAudioContext.createOscillator: TJSOscillatorNode;
begin

end;

function TJSBaseAudioContext.createPanner: TJSPannerNode;
begin

end;

function TJSBaseAudioContext.createPeriodicWave(real,
  imag: TDoubleDynArray): TJSPeriodicWave;
begin

end;

function TJSBaseAudioContext.createPeriodicWave(real, imag: TDoubleDynArray;
  constraints: TJSPeriodicWaveConstraints): TJSPeriodicWave;
begin

end;

function TJSBaseAudioContext.createScriptProcessor(bufferSize,
  numberOfInputChannels: NativeInt): TJSScriptProcessorNode;
begin

end;

function TJSBaseAudioContext.createScriptProcessor(
  bufferSize: NativeInt): TJSScriptProcessorNode;
begin

end;

function TJSBaseAudioContext.createScriptProcessor(bufferSize,
  numberOfInputChannels,
  numberOfOutputChannels: NativeInt): TJSScriptProcessorNode;
begin

end;

function TJSBaseAudioContext.createScriptProcessor: TJSScriptProcessorNode;
begin

end;

function TJSBaseAudioContext.createStereoPanner: TJSStereoPannerNode;
begin

end;

function TJSBaseAudioContext.createWaveShaper: TJSWaveShaperNode;
begin

end;

function TJSBaseAudioContext.decodeAudioData(audioData: TJSArrayBuffer;
  successCallback: DecodeSuccessCallback): TJSPromise;
begin

end;

function TJSBaseAudioContext.decodeAudioData(
  audioData: TJSArrayBuffer): TJSPromise;
begin

end;

function TJSBaseAudioContext.decodeAudioData(audioData: TJSArrayBuffer;
  successCallback: DecodeSuccessCallback;
  errorCallback: DecodeErrorCallback): TJSPromise;
begin

end;

function TJSBaseAudioContext.resume: TJSPromise;
begin

end;

{ TJSAudioContext }

function TJSAudioContext.close: TJSPromise;
begin

end;

function TJSAudioContext.createMediaElementSource(
  mediaElement: TJSElement): TJSMediaElementAudioSourceNode;
begin

end;

function TJSAudioContext.createMediaStreamDestination: TJSMediaStreamAudioDestinationNode;
begin

end;

function TJSAudioContext.createMediaStreamSource(
  mediaStream: JSValue): TJSMediaStreamAudioSourceNode;
begin

end;

function TJSAudioContext.createMediaStreamTrackSource(
  mediaStreamTrack: JSValue): TJSMediaStreamTrackAudioSourceNode;
begin

end;

function TJSAudioContext.getOutputTimestamp: TJSAudioTimestamp;
begin

end;

function TJSAudioContext.suspend: TJSPromise;
begin

end;

{ TJSOfflineAudioContext }

function TJSOfflineAudioContext.startRendering: TJSPromise;
begin

end;

function TJSOfflineAudioContext.suspend(suspendTime: Double): TJSPromise;
begin

end;

{ TJSAudioBuffer }

procedure TJSAudioBuffer.copyFromChannel(destination: TJSFloat32Array;
  channelNumber, startInChannel: NativeInt);
begin

end;

procedure TJSAudioBuffer.copyFromChannel(destination: TJSFloat32Array;
  channelNumber: NativeInt);
begin

end;

procedure TJSAudioBuffer.copyToChannel(source: TJSFloat32Array; channelNumber,
  startInChannel: NativeInt);
begin

end;

procedure TJSAudioBuffer.copyToChannel(source: TJSFloat32Array;
  channelNumber: NativeInt);
begin

end;

function TJSAudioBuffer.getChannelData(channel: NativeInt): TJSFloat32Array;
begin

end;

{ TJSAudioNode }

function TJSAudioNode.connect(destinationNode: TJSAudioNode; output,
  input: NativeInt): TJSAudioNode;
begin

end;

function TJSAudioNode.connect(destinationNode: TJSAudioNode): TJSAudioNode;
begin

end;

function TJSAudioNode.connect(destinationNode: TJSAudioNode;
  output: NativeInt): TJSAudioNode;
begin

end;

procedure TJSAudioNode.connect(destinationParam: TJSAudioParam);
begin

end;

procedure TJSAudioNode.connect(destinationParam: TJSAudioParam;
  output: NativeInt);
begin

end;

procedure TJSAudioNode.disconnect(destinationNode: TJSAudioNode);
begin

end;

procedure TJSAudioNode.disconnect(output: NativeInt);
begin

end;

procedure TJSAudioNode.disconnect;
begin

end;

procedure TJSAudioNode.disconnect(destinationNode: TJSAudioNode;
  output: NativeInt);
begin

end;

procedure TJSAudioNode.disconnect(destinationParam: TJSAudioParam;
  output: NativeInt);
begin

end;

procedure TJSAudioNode.disconnect(destinationParam: TJSAudioParam);
begin

end;

procedure TJSAudioNode.disconnect(destinationNode: TJSAudioNode; output,
  input: NativeInt);
begin

end;

{ TJSAudioParam }

function TJSAudioParam.cancelAndHoldAtTime(cancelTime: Double): TJSAudioParam;
begin

end;

function TJSAudioParam.cancelScheduledValues(cancelTime: Double): TJSAudioParam;
begin

end;

function TJSAudioParam.exponentialRampToValueAtTime(value,
  endTime: Double): TJSAudioParam;
begin

end;

function TJSAudioParam.linearRampToValueAtTime(value,
  endTime: Double): TJSAudioParam;
begin

end;

function TJSAudioParam.setTargetAtTime(target, startTime,
  timeConstant: Double): TJSAudioParam;
begin

end;

function TJSAudioParam.setValueAtTime(value, startTime: Double): TJSAudioParam;
begin

end;

function TJSAudioParam.setValueCurveAtTime(values: TDoubleDynArray; startTime,
  duration: Double): TJSAudioParam;
begin

end;

{ TJSAudioScheduledSourceNode }

procedure TJSAudioScheduledSourceNode.start(when: Double);
begin

end;

procedure TJSAudioScheduledSourceNode.start;
begin

end;

procedure TJSAudioScheduledSourceNode.stop(when: Double);
begin

end;

procedure TJSAudioScheduledSourceNode.stop;
begin

end;

{ TJSAnalyserNode }

procedure TJSAnalyserNode.getByteFrequencyData(array_: TJSUint8Array);
begin

end;

procedure TJSAnalyserNode.getByteTimeDomainData(array_: TJSUint8Array);
begin

end;

procedure TJSAnalyserNode.getFloatFrequencyData(array_: TJSFloat32Array);
begin

end;

procedure TJSAnalyserNode.getFloatTimeDomainData(array_: TJSFloat32Array);
begin

end;

{ TJSAudioBufferSourceNode }

procedure TJSAudioBufferSourceNode.start(when, offset, duration: Double);
begin

end;

procedure TJSAudioBufferSourceNode.start;
begin

end;

procedure TJSAudioBufferSourceNode.start(when: Double);
begin

end;

procedure TJSAudioBufferSourceNode.start(when, offset: Double);
begin

end;

{ TJSAudioListener }

procedure TJSAudioListener.setOrientation(x, y, z, xUp, yUp, zUp: Double);
begin

end;

procedure TJSAudioListener.setPosition(x, y, z: Double);
begin

end;

{ TJSBiquadFilterNode }

procedure TJSBiquadFilterNode.getFrequencyResponse(frequencyHz, magResponse,
  phaseResponse: TJSFloat32Array);
begin

end;

{ TJSIIRFilterNode }

procedure TJSIIRFilterNode.getFrequencyResponse(frequencyHz, magResponse,
  phaseResponse: TJSFloat32Array);
begin

end;

{ TJSOscillatorNode }

procedure TJSOscillatorNode.setPeriodicWave(periodicWave: TJSPeriodicWave);
begin

end;

{ TJSPannerNode }

procedure TJSPannerNode.setOrientation(x, y, z: Double);
begin

end;

procedure TJSPannerNode.setPosition(x, y, z: Double);
begin

end;

{ TJSAudioWorkletGlobalScope }

procedure TJSAudioWorkletGlobalScope.registerProcessor(name: String;
  processorCtor: TProcedure);
begin

end;
{$ENDIF}
end.
