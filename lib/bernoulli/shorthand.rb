# shorthand that returns new instance of `Distribution::Binomial`
def binomdist(n, p)
  Bernoulli::Distribution::Binomial.new(n, p)
end

# shorthand that returns new instance of `Distribution::Geometric`
def geomdist(p)
  Bernoulli::Distribution::Geometric.new(p)
end

# shorthand that returns new instance of `Distribution::Hypergeometric`
def hgeomdist(bn, m, n)
  Bernoulli::Distribution::Hypergeometric.new(bn, m, n)
end

# shorthand that returns new instance of `Distribution::Poisson`
def poissondist(l)
  Bernoulli::Distribution::Poisson.new(l)
end
