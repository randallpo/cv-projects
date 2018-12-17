function [H, theta, rho] = hough_lines_acc(BW, varargin)
    % Compute Hough accumulator array for finding lines.
    %
    % BW: Binary (black and white) image containing edge pixels
    % RhoResolution (optional): Difference between successive rho values, in pixels
    % Theta (optional): Vector of theta values to use, in degrees
    %
    % Please see the Matlab documentation for hough():
    % http://www.mathworks.com/help/images/ref/hough.html
    % Your code should imitate the Matlab implementation.
    %
    % Pay close attention to the coordinate system specified in the assignment.
    % Note: Rows of H should correspond to values of rho, columns those of theta.

    %% Parse input arguments
    p = inputParser();
    addParameter(p, 'RhoResolution', 1);
    addParameter(p, 'Theta', linspace(-90, 89, 180));
    parse(p, varargin{:});

    rhoStep = p.Results.RhoResolution;
    theta = p.Results.Theta;

    %% TODO: Your code here
    theta_len = length(theta);
    % max_rho = sqrt(sum(size(BW)-1) .^ 2);
    max_rho = ceil(norm(size(BW)-1, 2));
    rho_len = (2 * ceil(max_rho / rhoStep)) + 1;
    diagonal = rhoStep * ceil(max_rho / rhoStep);
    rho = linspace(-diagonal, diagonal, rho_len);
    H = zeros(rho_len, theta_len);
    [rows, cols] = size(BW);
    for y = 1:rows
      for x = 1:cols
        if (BW(y, x))
          for theta_idx = 1:theta_len
            degree = theta(theta_idx);
            rho_line = (x * cosd(degree)) + (y * sind(degree));
            rho_idx = find(rho <= rho_line, 1, 'last');
            H(rho_idx, theta_idx) = H(rho_idx, theta_idx) + 1;
          end
        end
      end
    end
end
