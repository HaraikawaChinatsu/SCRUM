// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require Chart.min
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(document).on('turbolinks:load', function() {
  if ($('#myLineChart').length) {
    var ctx = document.getElementById("myLineChart");
    var myLineChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: gon.diaries,
        datasets: [
          {
            label: '目標体重（kg）',
            data:gon.target_weights,
            borderColor: "rgba(255,0,0,1)",
            backgroundColor: "rgba(0,0,0,0)"
          },
          {
            label: '記録体重（kg）',
            data:gon.weight,
            borderColor: "rgba(0,0,255,1)",
            backgroundColor: "rgba(0,0,0,0)"
          }
        ],
      },
      options: {
        title: {
          display: true,
          text: ''
        },
        scales: {
          yAxes: [{
            ticks: {
              suggestedMax: 60,
              suggestedMin: 20,
              stepSize: 10,
              callback: function(value, index, values){
                return  value +  'kg'
              }
            }
          }]
        },
      }
    });
    debugger
  }
});
