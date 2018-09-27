pkg load image; % AFTER function definition

% Test code:
s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t = [1 1 0];
disp('Signal:'), disp([1:size(s, 2); s]);
disp('Template:'), disp([1:size(t, 2); t]);

c = normxcorr2(t, s);
[maxValue rawIndex] = max(c);
index = rawIndex - size(t, 2) + 1;

%index = find_template_1D(t, s);
disp('Index:'), disp(index);