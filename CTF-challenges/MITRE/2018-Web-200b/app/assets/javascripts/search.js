Array.prototype.diff = function(a) {
    return this.filter(function(i) {return a.indexOf(i) < 0;});
};

function IsIdInArray(array, id) {
  for (var i = 0; i < array.length; i++) {
    if (array[i] === id)
      return true;
  }
  return false;
}

var ready_run_once;
ready_run_once = function() {
  var userIDList = $.makeArray($('#usertable tr[id]').map(function() {
    return this.id;
  }));

  $(document).on('click', '#search_submit', function(event) {
    event.preventDefault();
    $.ajax({
      url: $(this).attr("href"),
      data: {query: $("#search").val() },
      success: function(data) {
        var matchingResults = data.ids.map(function(e) {return '#userNum' + e});
        $('#usertable tr[id]').each(function( _, elem ) {
          if(IsIdInArray(matchingResults, elem.id)) {
            $(elem).fadeIn();
          }
          else {
            $(elem).fadeOut();
          }
        });
      }
    });
  });
};

$(document).ready(ready_run_once);
$(document).on('page:load', ready_run_once);

