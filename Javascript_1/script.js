let enemy = 10;
let command;
let random;


while(true) {
  command = prompt('敵が現れた！　（【1】攻撃　【2】逃げる)');
  random = Math.floor(Math.random() * 10);
  
  //攻撃を選択
  if(command === '1') {
    
    enemy = enemy - random;
    console.log(random + 'の攻撃！');
    if(enemy <=0) {
      console.log('敵を倒した！');
      break;
    }
    console.log('敵の体力は残り' + enemy + 'です');
    
    //逃げるを選択
  } else if(command === '2') {
    
    console.log('無事に逃げた');
    break;
  }
}

console.log('ゲーム終了');