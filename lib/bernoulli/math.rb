module Math

  def self.factorial(n)
    
    if n < 0 or not n.is_a? Integer
      raise Math::DomainError, 'Numerical argument is out of domain - "factorial"'
    end
    if n == 0
      1
    else
      (1..n).inject(:*)
    end
  end
  
  def self.binomial(n, k)
    if n < 0 or n < k or not (n.is_a? Integer and k.is_a? Integer)
      raise Math::DomainError, 'Numerical argument is out of domain - "binomial"'
    end
    factorial(n)/(factorial(k) * factorial(n - k))
  end

end

