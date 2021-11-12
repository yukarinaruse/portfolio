window.onload = () => {
    let mode = 'create';
    
    
    function showResult(data) {
        document.getElementById('result').textContet = data.result;// 今回はメッセージが来る
        document.getElementById('data').innerHTML = data.html;// HTMLのtable要素の内容
        setButtonEvent();
    }
    
    function init() {
        mode = 'create';
        document.getElementById('buttonExe').textContent = '登録';
        document.getElementById('name').value = '';
        document.getElementById('count').value = '0';
    }
    
    function setButtonEvent() {
        const buttonUpdate = document.getElementsByClassName('update');
        for(let i in buttonUpdate) {
            buttonUpdate[i].onclick = e => {
                e.preventDefault();// 既定の動作の無効化
                const me = e.currentTarget;// 今押したボタン
                mode = 'update';// モード切替
                document.getElementById('buttonExe').textContent = '更新';//実行ボタンの名目を変更
                document.getElementById('id').value = me.getAttribute('data-id');// 隠し項目
            };
        }
        
        const buttonDelete = document.getElementsByClassName('delete');
        for(let i in buttonDelete) {
            buttonDelete[i].onclick = e => {
                e.preventDefault();// 既定の動作の無効化
                if(confirm('本当に削除しますか？')) {
                    const dataId = e.currentTarget.getAttribute('data-id');
                    fetchJSON('ajax.php','mode=delete','id=' + dataId).then(data => { showResult(data); });
                }
                init();
            };
        }
    }
    
    setButtonEvent();
    
    document.getElementById('init').onclick = e => {
        if(confirm('本当に初期化しますか？この操作は戻せません。')) {
            fetchJSON('model.php').then(data => {
                showResult(data);
                init();
            });
        }
    };
    
    document.getElementById('create').onclick = init;
    
    document.getElementById('buttonExe').onclick = e => {
switch(mode) {
    case 'create':// 新規
            fetchJSON('ajax.php','mode=create','name=' + document.getElementById('name').valie + '&count=' + document.getElementById('count').value).then(data => { showResult(data);});
            break;
    case 'update':// 更新
            fetchJSON('ajax.php','mode=update','id=' + document.getElementById('id').value + '&name=' + document.getElementById('name').value + '&count=' + document.getElementById('count').value).then(data => { showResult(data);});
}    
    };
};