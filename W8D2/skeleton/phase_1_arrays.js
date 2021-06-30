Array.prototype.uniq = function() {
  let newArray = [];
  this.forEach(element => {
    if (!newArray.includes(element)) {
      newArray.push(element);
    }
  })
  return newArray;
}

Array.prototype.twoSum = function() {
  let pairsArray = [];
  for (i = 0; i < this.length - 1; i++) {
    for (j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        pairsArray.push([i, j]);
      }
    }
  }
  return pairsArray;
}

Array.prototype.transpose = function() {
  let array = [];
  for (i = 0; i < this.length; i++) {
    let array2 = [];
    for (j = 0; j < this[0].length; j++) {
      array2.push(this[j][i]);
    }
    array.push(array2);
  }
  return array;
}
// console.log([[1, 2, 3], [4, 5, 6], [7, 8, 9]].transpose())
