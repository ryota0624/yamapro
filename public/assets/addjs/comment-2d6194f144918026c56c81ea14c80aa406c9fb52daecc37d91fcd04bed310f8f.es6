
  let state = {comment: 0}
  const commentChangeHandle = commentChange(state);

  let btn = document.getElementById('submit-btn');
  const btnStateChangeFunc = toggleBtnState(btn);
  btnStateChangeFunc();

  let comment = document.getElementById('inkome');
  comment.onkeyup = (ev) => {
    commentChangeHandle(ev);
    if(commentState(state)) {
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

function commentChange(state) {
  return (ev) => state.comment = ev.target.value.length;
}

function commentState(state) {
  let {comment} = state;
  if(comment > 0) {
    return true 
  } else {
    return false
  }
}