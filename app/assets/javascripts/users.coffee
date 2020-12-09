# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.draw_graph = ->
    ctx = document.getElementById("myChart").getContext('2d')
    barNum = 6
    labels = new Array(barNum)
    bgColors = new Array(barNum)
    bdColors = new Array(barNum)
    for i in [0...barNum]
        labels[i] = 'data' + i
        bgColors[i] = 'rgba(75, 192, 192, 0.2)'
        bdColors[i] = 'rgba(75, 192, 192, 1)'
    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            datasets: [{
                label: '# of Votes',
                data: gon.bardata,
                backgroundColor: bgColors,
                borderColor: bdColors,
                borderWidth: 1
            }, {
                label: 'Line Dataset',
                data: gon.linedata,
                type: 'line'
            }],
            labels: labels,
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    })

# window.draw_graph = ->
#     ctx = document.getElementById("myChart").getContext('2d')
#     myChart = new Chart(ctx, {
#         type: 'bar',
#         data: {
#             labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
#             datasets: [{
#                 label: '# of Votes',
#                 data: gon.data,
#                 # data: [12, 19, 3, 5, 2, 3],
#                 backgroundColor: [
#                     'rgba(255, 99, 132, 0.2)',
#                     'rgba(54, 162, 235, 0.2)',
#                     'rgba(255, 206, 86, 0.2)',
#                     'rgba(75, 192, 192, 0.2)',
#                     'rgba(153, 102, 255, 0.2)',
#                     'rgba(255, 159, 64, 0.2)'
#                 ],
#                 borderColor: [
#                     'rgba(255,99,132,1)',
#                     'rgba(54, 162, 235, 1)',
#                     'rgba(255, 206, 86, 1)',
#                     'rgba(75, 192, 192, 1)',
#                     'rgba(153, 102, 255, 1)',
#                     'rgba(255, 159, 64, 1)'
#                 ],
#                 borderWidth: 1
#             }]
#         },
#         options: {
#             scales: {
#                 yAxes: [{
#                     ticks: {
#                         beginAtZero:true
#                     }
#                 }]
#             }
#         }
#     })

