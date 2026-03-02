import "@typespec/http";
import "./users.tsp";

@service(#{ title: "API Service" })
namespace ApiService;
