$(document).ready(function() {

  var postId = $(".post-id")[0].textContent
  //use jquery to grab 
  //post.id


  $('.tag_checkbox').on('click', function(event) {

    var response = $.ajax("/posts/" + postId + "/taggings", 
      {
        method: "post",
        data: {tag_id: event.target.id },
        success: function(message){
          console.log(message)
        }
      })


    });

    // response.done( function() {
    //   debugger
    // });

//   var response = $.ajax('/path', { url: "/posts",
//                           method: "get"});

//   response.done()
});

// event.preventDefault()
