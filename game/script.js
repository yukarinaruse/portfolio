const wrap = document.getElementById('wrap');
const start = document.getElementById('start');



const textLists = [
    'ああああああああああ','いいいいいいいいいいいいい',
    'うううううううううううう','えええええ','おおおおおおおお'
    ];


let checkTexts = [];
let score = 0;

const createText = () => {
    const p = document.getElementById('text');
    const rnd = Math.floor(Math.random() * textLists.length);
    
    p.textContent = '';
    
    checkTexts = textLists[rnd].split('').map(value => {
        const span = document.createElement('span');
        
        span.textContent = value;
        p.appendChild(span);
        
        return span;
        });
    };
    
    const keyDown = e => {
        wrap.style.backgroundColor = '#666';
        if(e.key === checkTexts[0].textContent) {
            checkTexts[0].className = 'add-color';
            
            checkTexts.shift();
            score++;
            
            if(!checkTexts.length) createText();
        }else if(e.key === 'Shift') {
            wrap.style.backgroundColor = '#666';
        }else{
            wrap.style.backgroundColor = 'red';
        }
    };
    
    
    const rankCheck = score => {
        let text = '';
        
        
        if(score < 100) {
            text = `あなたのランクはCです。\nBランクまであと${100 - score}文字です。`;
        }else if(score < 200) {
            text = `あなたのランクはBです。\nAランクまであと${200 - score}文字です。`;
        }else if(score < 300) {
            text = `あなたのランクはAです。\nSらんくまであと${300 - score}文字です。`;
        }else if(score >= 300) {    
            text = `あなたのランクはSです。\nおめでとう！！！`;
        }
        
        return `${score}文字打てました！\n${text}\n【OK】リトライ／【キャンセル】終了`;
    };
    
    const gameOver = id => {
        clearInterval(id);
        
        const result = confirm(rankCheck(score));
        
        if(result) window.location.reload();
    };
    
    
    const timer = () => {
        let time = 60;
        const count = document.getElementById('count');
        const id = setInterval(() => {
            if(time <= 0) gameOver(id);
            
            count.textContent = time--;
        }, 1000);
    };
    
    
    start.addEventListener('click', () => {
        timer();
        createText();
        start.style.display = 'none';
        document.addEventListener('keydown', keyDown);
    })