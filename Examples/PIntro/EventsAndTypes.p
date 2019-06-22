//Events between client and server
event eRequest : requestType;
event eResponse: responseType;

//Events between server and helper
event eProcessReq: (id: int, val: any);
event eReqSuccessful;
event eReqFailed;

//Payload types
type requestType = (source: machine, id:int, val: any);
type responseType = (id: int, success: bool);

// P also supports other types like maps, sequences, float and also foreign types.
// P implements value semantics (e.g., values are cloned when sent to other machines)