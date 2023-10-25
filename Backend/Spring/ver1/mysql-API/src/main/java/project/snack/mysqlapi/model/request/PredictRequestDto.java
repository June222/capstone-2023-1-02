package project.snack.mysqlapi.model.request;

import lombok.Data;

// orginId를 입력하면 해당 origin id와 일치하는 origin객체를 찾아줌. json 양식용
@Data
public class PredictRequestDto {
    private Integer originId;
    private Integer defectLabel;
    private String imageUrl;
}
