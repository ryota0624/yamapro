'use strict'
  let state = {pass: "", passConf: ""}
  const passHandle = passChange(state);
  const passConfHandle = passConfChange(state);
  let btn = document.getElementById('submit-btn');
  const btnStateChangeFunc = toggleBtnState(btn);

  let pass = document.getElementById('user_password');
  pass.onkeyup = (ev) => {
    passHandle(ev);
    if(signFormState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };

  let passConf = document.getElementById('user_password_confirmation');
  passConf.onkeyup = (ev) => {
    console.log(ev.target.value)
    passConfHandle(ev);
    if(signFormState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };  


function toggleBtnState(btn) {
  return (bool) => {
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
  let {pass, passConf} = state;
  console.log(pass, passConf)
  if(pass === passConf && pass.length === 0) {
    return alertForm(true);
  }
  if(pass === passConf) {
    return alertForm(true)
  } else {
    return alertForm(false);
  }
}

function alertForm(bool) {
  let alertTag = document.getElementById('alert');
  if(bool) {
    alertTag.setAttribute('hidden','hidden');
  } else {
    alertTag.removeAttribute('hidden');
  } 
  return bool
}