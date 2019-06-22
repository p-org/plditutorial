//safe monitor
spec ReqIdsAreMonotonicallyIncreasing observes eRequest {
  var previousId : int;
  start state Init {
    on eRequest do (payload: requestType){
        assert(payload.id == previousId + 1);
        previousId = payload.id;
    }
  }
}

spec DiffBetweenReqAndResp observes eRequest, eResponse {
  var lastRequest: int;

  start state Init {
    on eRequest goto StartChecking with (payload: requestType) { lastRequest = payload.id; }
    on eResponse do { assert false, "Received Response without a Request!"; }
  }

  state StartChecking {
    on eRequest do (payload: requestType) { lastRequest = Max(lastRequest, payload.id); }
    on eResponse do (payload: responseType) { assert (payload.id <= lastRequest) && (lastRequest - payload.id <= 1); }
  }

  fun Max(a: int, b: int) : int {
    if(a >= b)
      return a;
    else
      return b;
  }
}


spec LivenessMonitor observes eRequest, eResponse {
  var pendingReq : int;

  start state Init {
    on eRequest goto WaitForResponse;  
  }

  hot state WaitForResponse {
    on eResponse goto Done;
  }

  cold state Done {}
}