function k = Noise(k)

[m,n] = size(k);
percent = 0.2;
x = m*n*percent;
noise_P = randi(m*n, [x, 1]);

for i=1:length(noise_P)
    
    k(noise_P(i)) = randi([1 256]);
    k(noise_P(i)) = 255;
end

end