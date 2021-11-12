window.onload = () => {
    function showResult(date){
        console.log(date);
        const text = document.getElementById('response');
        switch(date.result){
            case 0:// {"result":0,"count":4}
                text.textContent = date.count;
                break;
            case 1:// {"result":1,"count":0}
                text.textContent = '存在しない品目です';
                break;
            case 2:// {"result":2,"count":0}
                text.textContent = 'パラメーターが正しくありません';
                break;
            case 3:// {"result":3,"count":0}
                text.textContent = 'データベース接続失敗';
        }
    }
    
    //呼び出し---------------------------------
        document.getElementById('search').onclick = e => {
            e.preventDefault();
            fetchJSON('ajax.php','mode=search','name='+ document.getElementById('item').value).then(data =>{showResult(data);});
        };
    };