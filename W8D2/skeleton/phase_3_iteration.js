Array.prototype.bubbleSort = function() {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        [this[i], this[i + 1]] = [this[i + 1], this[i]];
        sorted = false;
      }
    }
  }
  return this;
}

String.prototype.substrings = function() {
  let subs = [];
  for (i = 0; i < this.length; i++) {
    for (j = i + 1; j < this.length + 1; j++) {
      subs.push(this.slice(i, j));
    }
  }
  return subs;
}
