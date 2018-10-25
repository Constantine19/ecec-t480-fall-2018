% Konstantin Zelmanovich
% Jayden Chen
% ECEC-T480 Homework 3

%%
% Problem 1
clear all
clc
% Part a
fprintf('\nComputing the determinant: \n')
matrix = [0 -3 7 2; 1 2 -1 3; 5 -2 0 2];
display(determinant(matrix))

% Part b
fprintf('\nUsing Cramers rule: \n')
D = [0 -3 7; 1 2 -1; 5 -2 0];
Dx = [2 -3 7; 3 2 -1; 2 -2 0];
Dy = [0 2 7; 1 3 -1; 5 2 0];
Dz = [0 -3 2; 1 2 3; 5 -2 2];

x = determinant(Dx)/determinant(D)
y = determinant(Dy)/determinant(D)
z = determinant(Dz)/determinant(D)

% Part c
fprintf('\nUsing Gauss elimination: \n')
a = [0 -3 7; 1 2 -1; 5 -2 0];
b = [2; 3; 2];
display(gauss_elim(a, b))

% Part d
fprintf('\nUsing Gaus-Jordan method: \n')
a = [0 -3 7; 1 2 -1; 5 -2 0];
b = [2; 3; 2];
display(gauss_jordan(a, b))

% Part e
fprintf('\nUsing Gaus-Seidel method: \n')
A = [0 -3 7; 1 2 -1; 5 -2 0];
b = [2; 3; 2];
display(gauss_seidel(A,b, 0.8, 10000))

% Part f
fprintf('\nUsing matinv and mmult: \n')
matrix = [0 -3 7; 1 2 -1 ; 5 -2 0 ];
b = [2; 3; 2];
display(mmult(matinv(matrix), b))

%% Problem 2
clear all
clc
% Part a
fprintf('\nComputing the determinant: \n')
matrix = [3 -2 1 -10; 2 6 4 44; -1 -2 5 -26];
display(determinant(matrix))

% Part b
fprintf('\nUsing Cramers rule: \n')
D = [3 -2 1; 2 6 4; -1 -2 5];
Dx = [-10 -2 1; 44 6 4; -26 -2 5];
Dy = [3 -10 1; 2 44 4; -1 -26 5];
Dz = [3 -2 -10; 2 6 44; -1 -2 -26];

x = determinant(Dx)/determinant(D)
y = determinant(Dy)/determinant(D)
z = determinant(Dz)/determinant(D)

% Part c
fprintf('\nUsing Gauss elimination: \n')
a = [3 -2 1; 2 6 4; -1 -2 5];
b = [-10; 44; -26];
display(gauss_elim(a, b))

% Part d
fprintf('\nUsing Gaus-Jordan method: \n')
a = [3 -2 1; 2 6 4; -1 -2 5];
b = [-10; 44; -26];
display(gauss_jordan(a, b))

% Part e
fprintf('\nUsing Gaus-Seidel method: \n')
A = [3 -2 1; 2 6 4; -1 -2 5];
b = [-10; 44; -26];
display(gauss_seidel(A,b, 0.8, 1000))

% Part f
fprintf('\nUsing matinv and mmult: \n')
matrix = [3 -2 1; 2 6 4; -1 -2 5];
b = [-10; 44; -26];
display(mmult(matinv(matrix), b))

%% Problem 3
clear all
clc

fprintf('\nUsing LU decomposition: \n')
matrix = [3 -2 1; 2 6 4; -1 -2 5];
b = [-10; 44; -26];
[L, U] = lu_decomp(matrix);
xx = U\(L\b)

%% Problem 4
clear all
clc

fprintf('\nElectrical engineer problem: \n')
a = [15 17 19; 0.3 0.4 0.55; 1 1.2 1.5];
b = [3890; 95; 282];
display(gauss_elim(a, b))

%% Problem 5
fprintf('\nUsed mesh analysis to come up with the system: \n')
a = [-25 0 -4 29; 11 -4 0 -5; -4 9 -5 0; 0 -25 37 -4];
b = [10;0;2;0];
display(gauss_elim(a, b))

