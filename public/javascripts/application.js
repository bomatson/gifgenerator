$(function() {
  var btn = document.querySelector('.copy-btn');

  btn.addEventListener('click', function() {
    var input = document.querySelector('.copy-input');
    var text = input.setSelectionRange(0, input.value.length)

    var successful = document.execCommand('copy', true, text);
    if(successful)
      btn.textContent = 'Copied!'
  });
})
