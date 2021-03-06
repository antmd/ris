#include <catch.hpp>

#include "resource.h"

#include <boost/filesystem.hpp>

#include "../ris_lib/ris_json_resources.h"
#include "../ris_lib/ris_resource_loader.h"
#include "../ris_lib/ris_resources.h"

class fixture {
protected:
    boost::filesystem::path test_data;
public:
    fixture() {
        static const char* candiadates[] = {
            ".",
            "./acceptance_test",
            "../acceptance_test",
        };
        for (auto p : candiadates) {
            if (exists(boost::filesystem::path(p) / "test.bin")) {
                test_data = p;
                break;
            }
        }
        REQUIRE(exists(test_data / "test.bin"));
        REQUIRE(exists(test_data / "test.json"));
    }
};

TEST_CASE_METHOD(fixture,"loading the resource") {
    auto r = ris::json_resources((test_data / "test.json").generic_string());

    auto& resources = r.resources().resources;

    REQUIRE(resources.size() > 0);

    std::vector<std::string> keys;
    test::Resource::GetKeys([&keys](const char* key){
        keys.emplace_back(key);
    });

    CHECK(resources.size() == keys.size());

    SECTION("resource fidelity") {
        for (auto& res : resources) {
            auto reference_data = ris::resource_loader(res,test_data.generic_string()).get();
            auto resource_data = test::Resource::Get(res.name);
            INFO(res.name);
            CHECK(reference_data == resource_data);
        }
    }
}

TEST_CASE("custom member names") {
    auto res = test::Resource::custom_member_name();
    CHECK(!res.empty());
    CHECK(res == test::Resource::Get("custom.member/name"));
}
