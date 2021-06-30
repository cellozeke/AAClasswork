function range(start, end) {
  if (start === end) {
    return [start];
  }
  return ([start].concat(range(start + 1, end)));
}

function sumRec(arr) {
  if (arr.length === 0) {
    return 0;
  }
  return arr[0] + sumRec(arr.slice(1, arr.length));
}

function exponent1(base, exp) {
  if (exp === 0) {
    return 1;
  }
  return base * exponent1(base, exp - 1);
}

function exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  }
  if (exp === 1) {
    return base;
  }
  if (exp % 2 === 0) {
    return exponent2(base, exp / 2) ** 2;
  } else {
    return base * (exponent2(base, (exp - 1) / 2) ** 2);
  }
}

function fibonacci(n) {
  if (n === 1) {
    return [1];
  }
  if (n === 2) {
    return [1, 1];
  }
  let array = fibonacci(n - 1);
  return array.concat(array[array.length - 2] + array[array.length - 1]);
}

function deepDup(arr) {
  if (arr.length === 0) {
    return [];
  }
  return [arr[0]].concat(deepDup(arr.slice(1, arr.length)));
}

function bsearch(arr, target) {
  if (arr.length === 0) {
    return -1;
  }
  // if (arr.length === 1) {
  //   if (arr[0] === target) {
  //     return 0;
  //   } else {
  //     return -1;
  //   }
  // }
  if (arr.length % 2 === 0) {
    middle = arr.length / 2;
  } else {
    middle = (arr.length - 1) / 2;
  }
  if (arr[middle] === target) {
    return middle;
  } else if (arr[middle] > target ) {
    return bsearch(arr.slice(0, middle));
  } else {
    let something = bsearch(arr.slice(middle + 1, arr.length));
    console.log(arr.slice(middle + 1, arr.length))
    if (something === -1) {
      return -1;
    }
    return middle + 1 + bsearch(arr.slice(middle + 1, arr.length));
  }
}

