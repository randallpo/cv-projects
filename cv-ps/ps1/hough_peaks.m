function peaks = hough_peaks(H, varargin)
    % Find peaks in a Hough accumulator array.
    %
    % Threshold (optional): Threshold at which values of H are considered to be peaks
    % NHoodSize (optional): Size of the suppression neighborhood, [M N]
    %
    % Please see the Matlab documentation for houghpeaks():
    % http://www.mathworks.com/help/images/ref/houghpeaks.html
    % Your code should imitate the matlab implementation.

    %% Parse input arguments
    p = inputParser;
    addOptional(p, 'numpeaks', 1, @isnumeric);
    addParameter(p, 'Threshold', 0.5 * max(H(:)));
    addParameter(p, 'NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    parse(p, varargin{:});

    numpeaks = p.Results.numpeaks;
    threshold = p.Results.Threshold;
    nHoodSize = p.Results.NHoodSize;

    % TODO: Your code here
    num = 0;
    offset = (nHoodSize - 1) / 2;
    peaks = zeros(numpeaks, 2);
    while(num < numpeaks)
        max_H = max(H(:));
        if (max_H < threshold)
            break
        end
        num = num + 1;
        [rows, cols] = find(H == max_H);
        peaks(num,:) = [rows(1), cols(1)];
        r1 = max(1, rows - offset(1));
        r2 = min(size(H,1), rows + offset(1));
        c1 = max(1, cols - offset(2));
        c2 = min(size(H,2), cols + offset(2));
        H(r1:r2, c1:c2) = 0;
    end
    peaks = peaks(1:num, :);
end