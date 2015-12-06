window.onload = () => {
  let state = {title: 0, text: 0}
  const titleChangeHandle = titleChange(state);
  const textChangeHandle = textChange(state);

  let btn = document.getElementById('post-btn');
  const btnStateChangeFunc = toggleBtnState(btn);
   btnStateChangeFunc();

  let title = document.getElementById('essay_title');
  title.onchange = (ev) => {
    titleChangeHandle(ev);
    if(essayState(state)) {
      btnStateChangeFunc(true);
    } else {
      btnStateChangeFunc(false);
    }
  };


  let text = document.getElementById('essay_text');
  text.onchange = (ev) => {
    textChangeHandle(ev);
    if(essayState(state)) {
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

function titleChange(state) {
  return (ev) => state.title = ev.target.value.length;
}

function textChange(state) {
  return (ev) => state.text = ev.target.value.length;
}

function essayState(state) {
  let {title, text} = state;
  if(title > 0 && text >0) {
    return true 
  } else {
    return false
  }
}