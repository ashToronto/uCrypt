$('document').ready(function() {
  $(".card").click(function() {
    const coin = $(this).parent().find("#coin").html()
    console.log("you selected: " + coin)
    fetch(`https://min-api.cryptocompare.com/data/histoday?fsym=${coin}&tsym=USD`)
      .then(res => res.json())
      .then(result => {
        console.log(result.Data)
        const xAxis_time = []
        const yAxis_closing_value = []
        const yAxis_high = []
        const yAxis_low = []
        const sell_price = result.Data[30].close
        result.Data.map(function(t) {
          // convert to string date format
          const timeString = new Date(t.time * 1000).toLocaleDateString()
          xAxis_time.push(timeString)
          yAxis_closing_value.push(t.close)
          yAxis_high.push(t.high)
          yAxis_low.push(t.low)
        })
        const ctx = document.getElementById('myChart'); // Create chart data points
        const myChart = new Chart(ctx, { // Create line chart
          type: 'line',
          data:
          {
            labels: xAxis_time,
            datasets: [{
              data: yAxis_closing_value,
              label: "close",
              borderColor: "#3e95cd",
              fill: false
            }, {
              data: yAxis_high,
              label: "High",
              borderColor: "#8e5ea2",
              fill: false
            }, {
              data: yAxis_low,
              label: "Low",
              borderColor: "#3cba9f",
              fill: false
            }]
          },
          options: {
            title: {
              display: true,
              text: coin + ' : $' + sell_price
            }
          }
        });
        $('#chart-wrapper').modal('show');
        $('#dismissChart').click(function() { //Delete old chart instances
          myChart.destroy()
        });
      });
  });
})
