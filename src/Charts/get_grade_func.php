<?php
/**
 * Created by PhpStorm.
 * User: Howard Yin
 * Date: 2018/7/4
 * Time: 20:43
 * @param $school_id
 * @param $start_year
 * @param $con
 */
function getGrade($school_id, $start_year, $con)
{
    $start_year = intval($start_year);
    $data_every_term = array();//每年的成绩统计
    $data_total_term = array(array(), array(), array(), array());//总的成绩统计
    $result = mysqli_query($con, "SELECT 课程名称,年份,学期,成绩,绩点,学分 FROM 开课 JOIN(SELECT 课程,年份,学期,成绩,绩点 FROM 成绩 WHERE 学号='$school_id')AS t ON 开课.课程编号=t.课程;");
    while ($row = mysqli_fetch_array($result))
    {
        $year = '大';
        switch (intval(substr($row['年份'], 0, strpos($row['年份'], '-'))) - $start_year)
        {
            case 0:
                $year = $year . '一';
                break;
            case 1:
                $year = $year . '二';
                break;
            case 2:
                $year = $year . '三';
                break;
            case 3:
                $year = $year . '四';
                break;
            case 4:
                $year = $year . '五';
                break;
            case 5:
                $year = $year . '六';
                break;
            case 6:
                $year = $year . '七';
                break;
            case 7:
                $year = $year . '八';
                break;
            case 8:
                $year = $year . '九';
                break;
            case 9:
                $year = $year . '十';
                break;
            case -1:
                $year = '负' . $year . '一';
                break;
            case -2:
                $year = '负' . $year . '二';
                break;
            case -3:
                $year = '负' . $year . '三';
                break;
            case -4:
                $year = '负' . $year . '四';
                break;
            default:
                $year = '未知年级';
        }
        switch ($row['学期'])
        {
            case 1:
                $year = $year . '上';
                break;
            case 2:
                $year = $year . '下';
                break;
            case 3:
                $year = $year . '小学期';
                break;
            default:
                $year = $year . '未知学期';
                break;
        }
        if (!array_key_exists($year, $data_every_term))//如果不存在这个学期的记录就加记录
        {
            $data_every_term[$year] = array(array(), array(), array(0, 0, 0, 0, 0), '学分' => array());
            $data_total_term[0][] = $year;
            $data_total_term[1][] = 0;
        }
        $data_every_term[$year][0][] = array('name' => $row['课程名称'], 'max' => 4);
        $data_every_term[$year][1][] = floatval($row['绩点']);
        if ($row['成绩'] > 90) $data_every_term[$year][2][0]++;
        elseif ($row['成绩'] > 80) $data_every_term[$year][2][1]++;
        elseif ($row['成绩'] > 70) $data_every_term[$year][2][2]++;
        elseif ($row['成绩'] > 60) $data_every_term[$year][2][3]++;
        else $data_every_term[$year][2][4]++;
        $data_every_term[$year]['学分'][] = $row['学分'];
        $data_total_term[2][] = $row['课程名称'];
        $data_total_term[3][] = floatval($row['成绩']);
    }
    $term_num = sizeof($data_total_term[1]);//学期总数
    for ($i = 0; $i < $term_num; $i++)
    {
        $y = $data_total_term[0][$i];//学期名
        $total_credit = 0;//$y学期的总学分
        $course_num = sizeof($data_every_term[$y][1]);//课程总数
        for ($j = 0; $j < $course_num; $j++)
        {
            $data_total_term[1][$i] += $data_every_term[$y][1][$j]*$data_every_term[$y]['学分'][$i];//学期总绩点*学分
            $total_credit += $data_every_term[$y]['学分'][$i];
        }
        $data_total_term[1][$i] = round($data_total_term[1][$i]/$total_credit,2);
    }
    $data = array('学期数据' => array(), '总计数据' => array());
    for ($i = 0; $i < $term_num; $i++)
    {
        $y = $data_total_term[0][$i];//学期名
        $data['学期数据'][$y][0] = $data_every_term[$y][0];
        $data['学期数据'][$y][1] = $data_every_term[$y][1];
        $data['学期数据'][$y][2] = $data_every_term[$y][2];
    }
    $data['总计数据'][0] = $data_total_term[0];
    $data['总计数据'][1] = $data_total_term[1];
    $data['总计数据'][2] = $data_total_term[2];
    $data['总计数据'][3] = $data_total_term[3];
    return $data;
}