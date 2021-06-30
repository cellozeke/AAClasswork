Array.prototype.myEach = function(callback) {
  // this.forEach(element => {
  //   callback(element);
  // })
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}

cb = function(element) {
  console.log(element);
}

Array.prototype.myMap = function(callback) {
  let newArray = [];
  // newArray.push(this.myEach(callback));
  this.myEach(element => {
    newArray.push(callback(element));
  })
  return newArray;
}

cb2 = function(element) {
  return element * 2;
}

Array.prototype.myReduce = function(callback, initialValue) {
  let newArray = this.slice(0);
  if (initialValue !== undefined) {
    newArray.unshift(initialValue);
  }
  let accumulator = newArray[0];
  this.forEach((element, i) => {
    if (i !== 0) {
      accumulator = callback(accumulator, element);
    }
  })
  return accumulator;
}

cb3 = function(accumulator, element) {
  return accumulator + element;
}

// .load phase_2_enumerable.js
// [1, 2, 3].myReduce(cb3)
