// class Clock {
//   constructor() {
//     this.date = new Date();
//     this.hour = this.date.getHours();
//     this.minute = this.date.getMinutes();
//     this.second = this.date.getSeconds();
//     this.printTime();
//     setInterval(this._tick.bind(this), 1000)
//     console.log(this)
//   }

//   printTime() {
//     console.log(`${this.hour}:${this.minute}:${this.second}`);
//   }

//   _tick() {
//     this.second++;
//     this.printTime();
//   }
// }

// // const clock = new Clock();

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum = 0, numsLeft, completionCallback) {
  // debugger
  if (numsLeft === 0) {
    reader.close();
    return completionCallback(sum);
  }
  reader.question('Input a number: ', function(num) {
    num = parseInt(num);
    sum += num;
    // reader.close();
    // numsLeft--;
    addNumbers(sum, --numsLeft, completionCallback);
  });
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
