%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%%   A U T H   S T A T E   L O G I C
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Auth Events

EmailSigninRequestEvent
LoginWithEmailAndPassEvent
AuthEmailCodeVerifyEvent
AuthAddNewPasswordEvent
-----
AuthProfileSubmitEvent
GymCodeVerifyEvent


%%% States

AuthLoadingState
AuthCodeSentState
AuthNewPassword
AuthDoneState
AuthErrorState
AuthInvalidCredentialsState
AuthWrongCodeState

%%%%%%%%%%  S I G N I N   F L O W  %%%%%%%%%%

EmailSigninRequestEvent  --> AuthLoadingState  --> AuthCodeSentState --> END
AuthEmailCodeVerifyEvent --> AuthLoadingState  --> AuthWrongCodeState --> {@REPEATE}
                                              \--> AuthNewPassword --> END
AuthAddNewPasswordEvent  --> AuthLoadingState  --> AuthDoneState --> END

GymCodeVerifyEvent       --> AuthLoadingState  --> {@TO_HOME_PAGE}
AuthProfileSubmitEvent   --> AuthLoadingState  --> {@TO_PROFILE_PAGE} --> {@TO_HOME_PAGE}


%%%%%%%%%%   L O G I N   F L O W   %%%%%%%%%%

LoginWithEmailAndPassEvent --> AuthLoadingState --> AuthDoneState --> {@TO_HOME_PAGE} 
                                               \--> AuthInvalidCredentialsState --> {@REPEATE}
