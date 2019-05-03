
# 1.1
check_prob = function(prob){
  if (prob >= 0 & prob <= 1){
    return(TRUE)
  }else{
    stop("invalid prob value")
  }
}

check_trials = function(trials){
  if (trials >= 0 & trials %% 1 == 0){
    return(TRUE)
  }else if (trials %% 1 != 0){
    stop("trials must be non-negative integer")
  }else{
    stop("invalid trials value")
  }
}

check_success = function(success, trials){
  for (i in 1:length(success)){
    if (success[i] >= 0 & max(success)<= trials & success %% 1 == 0){
      return(TRUE)
    }else if (success[i] > trials){
      stop("success cannot be greater than trials")
    }else if (success[i] %% 1 != 0){
      stop("success must be non-negative integer")
    }else{
      stop("invalid success value")
    }
  }
}

#1.2
aux_mean = function(trials, prob){
  mean = trials*prob
  return(mean)
}

aux_variance = function(trials, prob){
  variance = (trials*prob)*(1-prob)
  return(variance)
}

aux_mode = function(trials,prob){
  if (( (trials * prob)+prob) %% 1 == 0 & ((trials * prob)+prob) > 0){
   mode = c((trials * prob)+prob , (trials * prob)+prob -1 )
   return(mode)
  }else{
  mode = floor((trials*prob)+prob)
  return(mode)
  }
}


aux_skewness = function(trials, prob){
  skewness = (1-2*prob)/ (sqrt((trials*prob)*(1-prob)))
  return(skewness)
}

aux_kurtosis = function(trials, prob){
  kurtosis = (1-(6*prob)*(1-prob))/ ((trials*prob)*(1-prob))
  return(kurtosis)
}

#1.3 Function of bin_choose()
#' @title Binomial choose
#' @description computes the probabilities about the number of success in a fixed number of random trials performed under identical conditions
#' @param n number of trials (n >= 0)
#' @param k is a variable that repesents the number of success out of n trials (0<=k <= n)
#' @return the number of combinations in which k successes can oocur in n trials.
#' @export
#' @examples

bin_choose = function(n, k ){
  if (k > n){
    stop( "k cannot be greater than n")
  }
  choose = factorial(n)/(factorial(k)*factorial(n-k))
  return(choose)
}


#1.4 Function of bin_probability
#' @title Binomial probability
#' @description To calculate the probaility of success in numerber of trials
#' @param success is a variable that repesents the number of success out of n trials (0<=k <= n)
#' @param trials number of trials (n >= 0)
#' @param prob the probaility to win in oone trials
#' @return the number of combinations in which the number of successes can oocur in n trials.
#' @export
#' @examples

bin_probability = function(success,trials, prob){
  if (check_trials(trials) == TRUE
      & check_prob(prob) == TRUE
      & check_success(success, trials) == TRUE){
    result1 = bin_choose(n = trials,k = success)*prob^success*(1-prob)^(trials-success)
  } else if (check_trials(trials) != TRUE
             & check_prob(prob) == TRUE
             & check_success(success,trials) == TRUE) {
    stop("invalid trials value")
  } else if (check_trials(trials) == TRUE &
             check_prob(prob) != TRUE &
             check_success(success,trials) == TRUE) {
    stop("invalid probability value")
  } else if (check_trials(trials) == TRUE
             & check_prob(prob) == TRUE
             & check_success(success,trials) != TRUE) {
    stop("invalid success value")
  } else if (check_trials(trials) != TRUE
             & check_prob(prob) != TRUE
             & check_success(success,trials) == TRUE) {
    stop("invaild trials and probaility values")
  } else if (check_trials(trials) == TRUE
             & check_prob(prob) != TRUE
             & check_success(success,trials) != TRUE) {
    stop("invalid porbaility and success value")
  } else{
    stop("invaild trials and success value")
  }
  return(result1)
}


#1.5 Function bin_distribution()
#' @title Binomial Distribution
#' @description To calculate the distribution of particular probaility
#' @param trials number of trials (n >= 0)
#' @param prob the probaility to win in oone trials
#' @return A distribution table of particular probability
#' @export
#' @examples

bin_distribution = function(trials, prob){
  dat = data.frame( "success" = 0:trials,
                    "probability" = bin_probability(success = 0:trials, trials = trials,prob = prob),
                    stringsAsFactors = FALSE)
  class(dat) = c("bindis", "data.frame")
  return(dat)
}

#bin22 = bin_distribution(5,0.5)

#' @export
plot.bindis = function(x){
  plot1 = ggplot(x, aes(x= success, y =probability))+
    geom_bar(stat = "identity")+
    scale_x_continuous(breaks = 0:nrow(x))+
    scale_y_continuous(breaks = seq(0,1,0.05))
  return(plot1)
}
#plot(bin22)


#1.6 Function of bin_cumulative()
#' @title Binomial cumulative distribution
#' @description To calculate the cumulative distribution of a binomial
#' @param trials number of trials (n >= 0)
#' @param prob the probaility to win in oone trials
#' @return A cumulative table of particular probability
#' @export
#' @examples

bin_cumulative = function(trials, prob){
  cumdat = bin_distribution(trials,prob)
  cumulative = cumsum(cumdat$probability)
  cumdat = mutate(cumdat,"cumulative" = cumulative)
  class(cumdat) = c("bincum", "data.frame")
  return(cumdat)
}
# bin11 = bin_cumulative(5,0.5)
# class(bin11)

#' @export
plot.bincum = function(x){
  plot2 = ggplot(x, aes(x = success, y = cumulative))+
    geom_line(stat="identity")+
    geom_point(stat = "identity")+
    ylab("probability")+
    scale_x_continuous(breaks = 0:nrow(x))+
    scale_y_continuous(breaks = seq(0,1,0.2))
  return(plot2)
}
#plot(bin11)

#1.7 Function of bin_variable()
#' @title Binomial Random Variable object
#' @description To list out the number of trails and the probaility of success
#' @param trials number of trials (n >= 0)
#' @param prob the probaility to win in oone trials
#' @return the object of class "binvar", that is, a binomial random variable object
#' @export
#' @examples

bin_variable = function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  variable = list(trials = trials, probability = prob)
  class(variable) = "binvar"
  return(variable)
}

#bin1 = bin_variable(10,0.3)

#' @export
print.binvar = function(x = "binvar"){
  cat("Binomial variable", "\n\n")
  cat("Paramaters", "\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success:", x$probability)

}
#class(bin1)

#' @export
summary.binvar = function(x = "binvar"){
  sumbin = list(trials= x$trials,
                probability = x$prob,
                mean = aux_mean(x$trials, x$prob),
                variance = aux_variance(x$trials, x$prob),
                mode = aux_mode(x$trials,x$prob),
                skewness = aux_skewness(x$trials, x$prob),
                kurtosis = aux_kurtosis(x$trials, x$prob))
  class(sumbin) = "summary.binvar"
  return(sumbin)
}
#summary(bin1)

#' @export
print.summary.binvar =function(x = "summary.binvar"){
  cat("Summary Binomial", "\n\n")
  cat("Paramaters", "\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success:", x$probability, "\n\n")
  cat("Measures", "\n")
  cat("- mean:", x$mean, "\n")
  cat("- variance:", x$variance, "\n")
  cat("- mode:", x$mode, "\n")
  cat("- skewness:", x$skewness, "\n")
  cat("- kurtosis:", x$kurtosis, "\n")
}
#summary(bin1)

#1.8 Function of measures

bin_mean = function(trials, prob){
  if (check_trials(trials) == TRUE &
      check_prob(prob) == TRUE){
    mean = aux_mean(trials,prob)
    return(mean)
  }
}


bin_variance = function(trials, prob){
  if (check_trials(trials) == TRUE &
      check_prob(prob) == TRUE){
    variance = aux_variance(trials,prob)
    return(variance)
  }
}


bin_mode = function(trials, prob){
  if (check_trials(trials) == TRUE &
      check_prob(prob) == TRUE){
    mode = aux_mode(trials,prob)
    return(mode)
  }
}


bin_skewness = function(trials,prob){
  if (check_trials(trials) == TRUE &
      check_prob(prob) == TRUE){
    skewness = aux_skewness(trials,prob)
    return(skewness)
  }
}


bin_kurtosis = function(trials,prob){
  if (check_trials(trials) == TRUE &
      check_prob(prob) == TRUE){
    kurtosis = aux_kurtosis(trials, prob)
    return(kurtosis)
  }
}

