number = randn([1 5]);
disp(number);

matrix = randn([2 3]);
disp(matrix);

noise = randn([1 10000]);
[n, x] = hist(noise, linspace(-3, 3, 7));
plot(x, n);