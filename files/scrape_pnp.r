#install.packages("rvest")
library(rvest)

url       <-"https://login.pnp.co.za/login"   ## page to spider
pgsession <-html_session(url)               ## create session
pgform    <-html_form(pgsession)[[1]]       ## pull form from session

# Note the new variable assignment 

filled_form <- set_values(pgform,
                          j_username = "",
                          j_password = "")

submit_form(pgsession,filled_form)

order_pnp <- read_html("http://shop.pnp.co.za/b2c_pnp/pnp/cllOrderDetailPrepare/(layout=5.1-10_2_4_51_8_3&uiarea=2&carea=%24ROOT)/.do?transactionNumber=WC27170701130700000000000000004283300000000020")

orderdt <- order_pnp %>%
  html_nodes("#html") %>%
  html_text()
orderdt


