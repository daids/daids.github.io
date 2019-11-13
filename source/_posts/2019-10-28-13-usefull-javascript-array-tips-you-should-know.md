title: 13个有用的JavaScript数组技巧
date: 2019-10-28 14:09:30
tags:
	- JavaScript
---

原文出自：[13 useful JavaScript array tips and tricks you should know](https://dev.to/duomly/13-useful-javascript-array-tips-and-tricks-you-should-know-2jfo)
数组是JavaScript中很重要的内容，作为数据存储非常的灵活，这也是很多开始学习JavaScript的人需要掌握的最基本的内容，下面我会列出一些你可能不知道的数组技巧，这或许会给你在实际编码中带来很大帮助，废话不多说，开始吧！
#### 1.数组中去重
经常会有面试提问，如何取出数组不重复的元素？ 这里有一个非常简单快速的方法，你可以使用`Set()`来解决。我用`.from()`方法和展开语法`(...)`
```javascript
var fruits = ['banana', 'apple', 'orange', 'watermelon', 'apple', 'orange'];
var uniqueFruits = Array.from(new Set(frunits));
console.log(uniqueFruits);
//["banana", "apple", "orange", "watermelon"]
var uniqueFruits2 = [...new Set(funits)];
console.log(uniqueFruits2);
//["banana", "apple", "orange", "watermelon"]
```
是否很简单！
#### 2.替换数组中指定值
有时需要替换数组中的指定值，这时候可以使用`.splice()`函数来解决
```javascript
var fruits = ['banana', 'apple', 'orange', 'watermelon', 'apple', 'orange'];
fruits.splice(0, 2, 'potato', 'tomato');
console.log(fruits);
//["potato", "tomato", "orange", "watermelon", "apple", "orange"]
```
#### 3.不用map函数来映射数组
或许大家都知道map函数，但是有一个不同的解决方法代码更简洁，就是使用`.from`方法
```javascript
var friends = [
	{name: 'xiaoming', age: 22 },
	{name: 'xiaozhang', age: 33},
	{name: 'xiaoli', age: 25},
	{name: 'xiaoliu', age: 30}
];
var friendsNames = Array.from(friends, ({name}) => name);
console.log(friendsNames);
//["xiaoming", "xiaozhang", "xiaoli", "xiaoliu"]
```
#### 4.清空数组
有时候你会需要清空一个数组，这时你是否在考虑一个个来删除？有个很简单的方法，就是设置数组`length`为0
```javascript
var fruits = ['banana', 'apple', 'orange', 'watermelon', 'apple', 'orange'];
fruits.length = 0;
console.log(fruits);
//[]
```
#### 5.把数组转转换对象
有时候需要将数据转换为对象，非常快的转换方法就是使用展开操作`(...)`
```javascript
var fruits = ['banana', 'apple', 'orange', 'watermelon', 'apple', 'orange'];
var fruitsObject = {...fruits};
console.log(fruitsObject);
//{0: "banana", 1: "apple", 2: "orange", 3: "watermelon", 4: "apple", 5: "orange"}
```
#### 6.填充数组
当我们创建数组时，需要给数组填充一些数据，这时候可以使用`.fill()`方法来解决，既简单又容易
```javascript
var newArray = new Array(10).fill('1');
console.log(newArray);
//["1", "1", "1", "1", "1", "1", "1", "1", "1", "1"]
```
#### 7.合并数组
知道不使用`.concat()`方法怎么合并数组吗？ 可以使用展开操作开实现。
```javascript
var fruits = ['apple', 'banana', 'orange'];
var meat = ['poultry', 'beef', 'fish'];
var vegetables = ['potato', 'tomato', 'cucumber'];
var food = [...fruits, ...meat, ...vegetables];
console.log(food);
//["apple", "banana", "orange", "poultry", "beef", "fish", "potato", "tomato", "cucumber"]
```
#### 8.寻找两个数组的交集
这是面试中经常遇到的一个问题，为了确保没有重复项，我们使用`.filter()`方法和`.includes()`方法
```javascript
var numOne = [0, 2, 4, 6, 8, 8];
var numTwo = [1, 2, 3, 4, 5, 6];
var duplicatedValues = [...new Set(numOne)].filter(item => numTwo.includes(item));
console.log(duplicatedValues);
//[2, 4, 6]
```
#### 9.移除数组中的空值
首先我们定义什么是空值，在JavaScript中，空值是`false`、`0`、` `、`''`、`null`、`NaN`、`undefined`，现在使用`.filter()`方法来解决这个问题
```javascript
var mixedArr = [0, 'blue', '', NaN, 9, true, undefined, 'white', false];
var trueArr = mixedArr.filter(Boolean);
console.log(trueArr);
//["blue", 9, true, "white"]
```
#### 10.从数组中获取随机值
有时候需要从数组中获取一个随机值，既简单又快，而且简洁的代码
```javascript
var colors = ['blue', 'white', 'green', 'navy', 'pink', 'purple'];
var randomColor = colors[(Math.floor(Math.random()*(colors.length)))];
```
#### 11.翻转数组
当我们需要翻转一个数组时我们不需要通过循环遍历来解决，一个非常简单的翻转函数就可以解决
```javascript
var colors = ['blue', 'white', 'green', 'navy', 'pink', 'purple'];
var reversedColors = colors.reverse();
console.log(reversedColors);
//["purple", "pink", "navy", "green", "white", "blue"]
```
#### 12.lastindexOf()方法
这是个有趣的方法，数组中有很多重复值的时候，我们可以找到最后一次出现位置
```javascript
var nums = [1, 2, 3, 4, 5, 6, 7, 8, 4, 6, 5, 12, 6, 7, 9];
var lastIndex = nums.lastIndexOf(5);
console.log(lastIndex);
//10
```
#### 13.数组元素求和
面试中经常遇到的问题
```javascript
var nums = [1, 3, 4, 5, 6, 7, 8];
var sum = nums.reduce((x, y) => x + y);
console.log(sum);
//34
```
#### 写在最后
感谢各位看到这里，上面列出的这些方法既简洁又实用，希望大家能够喜欢！
