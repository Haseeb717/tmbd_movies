jQuery(document).ready(function() {

  $(document).on('click', '.rating_stars', function(event) {
    id = $(this).attr('id');
    radio_button_id = "#"+id+"-radio";
    $('.star_radio').attr('checked', false);
    $(radio_button_id).attr('checked', 'checked');
  });

  $(document).on('click','.btn-submit-rating',function(event){
    var favorite = 0;
    comment = $("#comment").val();
    $.each($("input[name='model_rating']:checked"), function(){            
      favorite = ($(this).val());
    });  
    if( $('#movie_id').val() != "" && favorite > 0 && comment != ""){
            $.ajax({
                type: 'GET',
                url: "/home/add_ratings?movie_id="+$('#movie_id').val()+"&rate="+favorite+"&comment="+comment+"&name="+$('#movie_name').val()
            }).done(function ( data ) {
                $(".close").click()
          			$("#successModal").modal('show');
            }).fail(function (jqXHR, textStatus) {
                $(".close").click();
                alert("Error submitting your ratings. Kindly try again.")
      			});
    }else{
      alert("Please complete your review");
    }
  });

});