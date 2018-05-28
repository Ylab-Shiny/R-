### \Dropbox\Yamaha-lab\user files\Sahashi\R\Shiny\shinyapp\app.R ###
library(shiny)

# 1ガロンあたりのマイル数のUIを定義する---
ui <- pageWithSidebar(
  # アプリのタイトル---
  headerPanel("Miles Per Gallon"),
  
  # 入力の為のサイドバーパネル---
  sidebarPanel(
    # 入力：mpgに対してプロットする変数のセレクタ---
    selectInput("variable", "Variable:",
                c("Cylinders" = "cyl",
                  "Transmission" = "am",
                  "Gears" = "gear")),
    
    # 入力：異常値を含めるべきかどうかのチェックボックス
    checkboxInput("outliers", "Show outliers", T)
  ),
  
  # 結果出力の為のメインパネル---
  mainPanel(
    # 出力：キャプションのフォーマットされたテキスト---
    h3(textOutput("caption")),
    
    # 出力：mpgに対する要求された変数のプロット---
    plotOutput("mpgPlot")
  )
)

# データの前処理---
# "am"変数を微調整してより良い因子ラベルを作成する
# これはユーザーの入力に依存しないため、起動時にこれを1回実行してから、アプリの生涯を通して値を使用することができる
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

# mpg（miles-per-gallon）に対してさまざまな変数をプロットするためのサーバーロジックを定義する---
server <- function(input, output){
  # 数式テキストを計算する---
  # output$captionとoutput$mpgPlot関数で共有されるため、これは反応式である
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  # キャプションとして印刷するための式テキストを返す
  output$caption <- renderText({
    formulaText()
  })
  
  # mpgに対して要求された変数のプロットを生成する
  # 要求された場合にのみ異常値を除外する
  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = mpgData,
            outline = input$outliers,
            col = "#75AADB", pch = 19)
  })
}

shinyApp(ui, server)