def binomdist(n, p)
  Bernoulli::Distribution::Binomial.new(n, p)
end

def geomdist(p)
  Bernoulli::Distribution::Geometric.new(p)
end

def hgeomdist(bn, m, n)
  Bernoulli::Distribution::Hypergeometric.new(bn, m, n)
end

def poissondist(l)
  Bernoulli::Distribution::Poisson.new(l)
end
