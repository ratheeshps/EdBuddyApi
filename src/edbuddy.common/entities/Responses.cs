using System;
using System.Runtime.Serialization;

namespace edbuddy.common.entities
{
    [DataContract]
    public class ApiResponse<T>
    {
           
            [DataMember(Name = "Message")]
            public string Message { get; set; }

            [DataMember(Name = "Code")]
            public int Code { get; set; }

            [DataMember(Name = "Data")]
            public T Data { get; set; }
    }

}
