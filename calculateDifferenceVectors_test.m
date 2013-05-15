p = [0 0;0 0];
expected = [];
expected(:,:,1) = [0 0;0 0];
expected(:,:,2) = [0 0;0 0];
assert(calculateDifferenceVectors(p),expected)


p = [1 1;1 1];
expected = [];
expected(:,:,1) = [0 0;0 0];
expected(:,:,2) = [0 0;0 0];
assert(calculateDifferenceVectors(p),expected)

p = [0 0
     1 1];
expected = [];
expected(:,:,1) = [
 0 -1
 1  0];
expected(:,:,2) = [
 0 -1
 1  0];
assert(calculateDifferenceVectors(p),expected)

p = [0.3 4.7
     9.6 2.8];
expected(:,:,1) = [
 0      0.3-9.6
 9.6-0.3  0];
expected(:,:,2) = [
 0     4.7-2.8
 2.8-4.7  0];

