library(Recharts)
library(jsonlite)
shinyServer(
  function(input,output,session){
    data_line_bar <- data.frame('最高'=c(35,45,40,35,55,35,45,40,35,55),
                                '中间'=c(2.5,3.5,3.0,2.5,4.5,2.5,3.5,3.0,2.5,4.5),
                                '最低'=c(1.5,2.5,2.0,1.5,3.5,1.5,2.5,2.0,1.5,3.5))
    row.names(data_line_bar) <- c('3-13-13-13-1','3-23-23-2','3-3','3-4','3-5','3-6','3-7','3-8','3-9','3-10')

    data_line_bar_2 <- data.frame('最高'=c(35,45,40,35,55))
    row.names(data_line_bar_2) <- c('3-1','3-2','3-3','3-4','3-5')
    #饼图数据
    data_pie <- data.frame('直接访问'=100000000,
                           'SEO'=200000000,
                           'SEM'=180000000,
                           'REF'=234000000
    )
    #漏斗图数据
    data_funnel <- data.frame('点击'=100,
                              '下单'=50,
                              '支付'=20,
                              '收货'=19)
    #地图数据
    data_map_china <- data.frame("上海"=1200,"北京"=500)
    data_map_BJ <- data.frame("黄浦区"=120,"浦东新区"=300)
    data_scatter <- data.frame(a=c(100,89,110,90,150),b=c(0.1,0.2,0.15,0.3,0.4),c=c("a","b","c","d","e"))

    # 堆叠柱形图

    output$data_line_bar_1 <- renderEplot({
      Eplot(type="line",data=data_line_bar,
            title="标题",
            xAxisAll = TRUE,
            yAxisMin=10,
            tooltip.trigger = 'axis',
            legend_show=c("最高","最低"), #  是否只显示指定的几条折线
            series_rectangular_itemStyle=TRUE # 是否在折线上显示数据
            )
    })

    output$data_line_bar_2 <- renderEplot({
      Eplot(type="bar",data=data_line_bar,
            yAxisName=c('金额万','金额元'), # y轴的名称
            yAxisIndex=c(0,1,1), # 0为左侧坐标轴，1为右侧
            stack=c('1','test','test'), # 是否使用堆积图，名字相同的堆积在一起
            title="标题",
            tooltip.trigger = 'axis')
    })

    output$data_line_bar_3 <- renderEplot({
      Eplot(type="bar",data=data_line_bar_2,yAxisMin=20)
    })
    output$data_pie <- renderEplot({
      Eplot(type="pie",data=data_pie,tooltip.formatter = "{b}:{c}万({d}%)")
    })
    output$data_funnel <- renderEplot({
      Eplot(type="funnel",data=data_funnel)
    })

    output$data_map_china <- renderEplot({
      Eplot(type="map",data=data_map_china,
            mapType="china",visualMap_max=5000
      )
    })
    output$data_map_BJ <- renderEplot({
      Eplot(type="map",data=data_map_BJ,
            mapType="上海",visualMap_max=150
      )
    })

    output$data_map_scatter <- renderEplot({
      Eplot(type="scatter",data=data_scatter,scatter_x = "x轴",scatter_y = "y轴")
    })
  })
