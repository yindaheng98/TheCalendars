var data;

(function ()
{
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    }
    else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
        {
            if (xmlhttp.responseText.indexOf('error') !== -1)//有错误
            {
                alert(xmlhttp.responseText.split(':')[1]);
                location.replace('../home.php');
            }
            else if(xmlhttp.responseText.indexOf('null') !== -1)
            {
                alert(xmlhttp.responseText.split(':')[1]);
                location.replace('../PersonalInfo.html');
            }
            else
            {
                data = JSON.parse(xmlhttp.responseText);
            }
        }
    };
    xmlhttp.open("GET", "get_grade.php", false);
    xmlhttp.send();
})();