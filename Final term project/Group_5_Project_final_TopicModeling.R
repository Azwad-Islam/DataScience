library(tm)
#install.packages("topicmodels")
library(topicmodels)
library(ggplot2)

file <- "F://sem 11/IDS/DataScience/Final term project/tokens_output.csv"
Mydata <- read.csv(file, stringsAsFactors = FALSE)


text_corpus <- Corpus(VectorSource(Mydata$tokens))
print(text_corpus)


dtm <- DocumentTermMatrix(text_corpus)
print(dtm)


tfidf_cal <- weightTfIdf(dtm)
print(tfidf_cal)



row_totals <- apply(dtm, 1, sum)
dtm_filtered <- dtm[row_totals > 0, ] 
num <- 5  


lda <- LDA(dtm_filtered, k = num, control = list(seed = 123))


LDA_TopicTermWeights <- posterior(lda)$terms
for (i in 1:num) {
  cat(sprintf("\nTopic %d:\n", i))

  token_weights <- sort(LDA_TopicTermWeights[i, ], decreasing = TRUE)
  top_tokens <- head(token_weights, 15)
  
  for (token in names(top_tokens)) {
    cat(sprintf("%s (%.4f)\n", token, top_tokens[token]))
  }
}



for (i in 1:num) {
  token_weights <- sort(LDA_TopicTermWeights[i, ], decreasing = TRUE)
  top_tokens <- head(token_weights, 15)
  

  topic_df <- data.frame(
    Term = names(top_tokens),
    Frequency = top_tokens
  )
  
print(
    ggplot(topic_df, aes(x = reorder(Term, -Frequency), y = Frequency, fill = Term)) +
      geom_bar(stat = "identity") +
      labs(
        title = paste("Key Terms by Topic", i),
        x = "Terms",
        y = "Frequency"
      ) +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  )
}

