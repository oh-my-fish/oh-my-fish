function omf.util_valid_package -a package
  test (echo "$package" | tr "[:upper:]" "[:lower:]") = "omf"; and return 10
  test (echo "$package" | tr "[:upper:]" "[:lower:]") = "default"; and return 10
  switch $package
    case {a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}\*
      switch $package
        case "*/*" "* *" "*&*" "*\"*" "*!*" "*&*" "*%*" "*#*"
          return 10
        case "*"
          return 0
      end
    case "*"
      return 10
  end
end
