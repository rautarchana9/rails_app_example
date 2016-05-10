
function showProgress() {
  document.getElementById('loan-form').style.display = "none";
  document.getElementById('status-bar').style.display = "block";
}
$(document).ready(function(){
  $('#new_loan :submit').click(function(e) {
    showProgress();
    $('#bar').css('width', 50 +'%');
  });
});
