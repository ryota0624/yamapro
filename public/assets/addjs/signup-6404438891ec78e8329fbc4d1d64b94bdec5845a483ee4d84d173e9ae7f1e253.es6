window.onload = () => {
  let state = {name: 0, pass: "", passConf: ""}
  const nameHandle = nameChange(state);
  const passHandle = passChange(state);
  const passConfHandle = passConfChange(state);

  let btn = document.getElementById('submit-btn');
  const btnStateChangeFunc = toggleBtnState(btn);
   btnStateChangeFunc();

  let userName = document.getElementById('user_name');
  userName.onchange = (ev) => {
    nameHandle(ev);
    if(signFormState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };

  let pass = document.getElementById('user_pass');
  pass.onchange = (ev) => {
    passHandle(ev);
    if(signFormState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };

  let passConf = document.getElementById('user_password_confirmation');
  passConf.onchange = (ev) => {
    passConfHandle(ev);
    if(signFormState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };  
}

function toggleBtnState(btn) {
  return (bool) => {
    console.log('fuck')
    if(bool) {
      btn.removeAttribute('disabled');
    } else {
      btn.setAttribute('disabled','disabled');
    }
    return btn
  }
} 

function nameChange(state) {
  return (ev) => state.name = ev.target.value.length;
}

function passChange(state) {
  return (ev) => state.pass = ev.target.value;
}

function passConfChange(state) {
  return (ev) => state.passConf = ev.target.value;
}

function signFormState(state) {
  let {name, pass, passConf} = state;
  if(name > 0 && pass === passConf) {
    return true 
  } else {
    return false
  }
}