async function fetchJSON(requestURL, getQuery = '', postQuery = '') {
    const usePost = postQuery !='';//POSTかどうか
    
    
// リクエストデータ
    const data = {
        method: usePost ? 'POST' : 'GET',
        headers: {'Content-Type': usePost ? 'application/x-www-form-urlencoded' : 'text/plain'},
        mode: 'cors',
        cache: 'no-cache',
        credentials: 'same-origin',
        redirect: 'follow',
        referrerPolocy: 'no-referrer'
    };
    if(usePost) data.body = postQuery;
    
    const response = await fetch(requestURL + (getQuery != '' ? '?' + getQuery : ''), data);
    return response.Json();
}