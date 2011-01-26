function faktoriyel(a)
sonuc=1;
   for b=1:a
      sonuc=sonuc*b;
   end
faktoriyel=sonuc;
fprintf(' Girilen sayinin faktoriyeli : %f \n ',sonuc);
end