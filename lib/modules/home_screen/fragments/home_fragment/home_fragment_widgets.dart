import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/configs/app_routes.dart';

import '../../../../models/user.dart';

class HomeFragmentWidget {
  static header({
    required User user,
    required GlobalKey<ScaffoldState> homeScaffoldState,
  }) {
    return HeaderWidget(
      user: user,
      homeScaffoldState: homeScaffoldState,
    );
  }

  static searchField() {
    return const SearchFieldWidget();
  }

  static sectionTitle(String label) {
    return SectionTitle(label: label);
  }

  static hotestNewsCard(
    Size size,
    String pictureUrl,
    String newsTitle,
  ) {
    return HotestNewsCard(
      size: size,
      pictureUrl: pictureUrl,
      newsTitle: newsTitle,
    );
  }

  static latestNewsCard(Size size, int i) {
    return LatestNewsCard(size: size, i: i);
  }

  static latestNewsSection(Size size) {
    return LatestNewsSection(size: size);
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.user,
    required this.homeScaffoldState,
  });

  final User user;
  final GlobalKey<ScaffoldState> homeScaffoldState;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi, Selamat datang"),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            homeScaffoldState.currentState!.openEndDrawer();
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              user.profilePhoto!,
            ),
          ),
        ),
      ],
    );
  }
}

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        isDense: true,
        hintText: "Masukkan kata kunci disini",
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        suffixIcon: const Icon(
          Icons.search_rounded,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const Icon(
          Icons.chevron_right_rounded,
        ),
      ],
    );
  }
}

class HotestNewsCard extends StatelessWidget {
  const HotestNewsCard({
    super.key,
    required this.size,
    required this.pictureUrl,
    required this.newsTitle,
  });

  final Size size;
  final String pictureUrl;
  final String newsTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            16,
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              pictureUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 50,
            width: size.width - 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Text(
            newsTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class LatestNewsCard extends StatelessWidget {
  const LatestNewsCard({
    super.key,
    required this.size,
    required this.i,
  });

  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.black12,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).goNamed(
                AppRoutes.newsDetail,
                params: {
                  "id": i.toString(),
                },
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.25,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        "https://i.ytimg.com/vi/N35BfcEYxmw/maxresdefault.jpg",
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Berita Pertama",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.black12,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).goNamed(
                AppRoutes.newsDetail,
                params: {
                  "id": i.toString(),
                },
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.25,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUWFRgWFhUZGBgaGhoYGhgaHBgaGhgeGBwaGhwcGBwcIS4lHB4rHxwYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHxISHjQkISU0MTQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0ND80PzQ0NDExMf/AABEIAJ8BPgMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAEAQIDBQYABwj/xABEEAABAwIDBAcECAQFAwUAAAABAAIRAyEEEjEFQVFhInGBkaGxwQYy0fATQlJicoKy4SOSosIHFCRj8TRz0jNDU4Pi/8QAGQEAAwEBAQAAAAAAAAAAAAAAAQIDAAQF/8QAIREAAwEAAwEBAQADAQAAAAAAAAECEQMhMRJBMhNRYSL/2gAMAwEAAhEDEQA/ALTAN6T+bx+hiipss7m8/rj0Rez23dzd/a1QuFvzfErl/TpLv2dZLnngGjvJP9qvWhVnsxSlj3cXAfygn+5W7Gru4upR5/M9tkDW9I9Q8yqr2howGPt0X5T1PED+oBXjWdKPunzHxQ+18Lno1BvDc462HMPJG+5aBxvKTMmdR1kd4/ZDZoy8nlveS0eiJcdD1H57ELjBGfllf5f+JXCehpLUu1w6/wBMjxCGp2rMPEvHe1x9UQwyeRjzPxCG0dTPB7fEQsFkbTGKZ1uHewrSbI9x/wCM+TVnK4jEsPE+hHotFsb3H/8Acd5NRQH4Wp0VDXHTf+J3ZcrQRZUWKHTfzJ80KNPoI7Tl5JQdN3D910fPC6Rwk8PRTKitFz8wo6sR5fAqYjXn8+Kic2x+YQMT4LT0+KIablD4T63lwspxrAVZ8JMc7RCYodB08EWAoa9IuaRxBClX9DrwvcD7jeoKspjpA858U3B7RqNaGupgxAnNbs3paTrjrCamngEsMnh74al1j9CtmCzedbyMKqww/wBPRHGP0D4q2cLM5vefFZmImU+mB9ymO9TbEEve7iXHvStH8Q/dDPBsqHDbQpUGF9R0awBdx6h8VvTaafZbJa88Xn+klvorN2HkH53Beaj/ABDyNDWUA6N7nmSSSdAOfFdU/wATcQWw2kxruMyOvKRPDeu2WlKRx3LqmzUAWcOpOpDoDkf2WEZ7bPvmY0zw+fgtRsLbDK7DlMOBJcwm4kz2i+q5blo6pZNiX/xKJ/3HjvolBYRv+mA/3D6Iqp77OVbzpFD4UfwWj/c+CT8GL3ACGn8R8ghsQf47fyovBe5PN3mgq4/1Dfy/pTvxCL1loE9qYntTAG4n3H/hPkqOwHb1/P7q8xPuO6iqN8R2n90tBkTANsesnuH7IesNBzJ8I9UZgh0f5vMobE6gfi8x8EUjfprvZejGHn7TnHyb6KwDNUzYdPLQpji3N/N0vVExqumHiOTlnXoLHTb+F3p8EUGSTO8QoXjps7fIosBGmLEnnmIoZC9n2XOb3G3hCgxzJA+8xzfC3mVee0VHLXJ+20O7R0T5NVVXb/DafsuHq31XNS7OxPorsM+WtPEen/5SYhvRPJ48HLsOIkfZcR428CpK46L/AMp8kP0cgxn/AFFM8x5uWg2N7r/xn9LVnsX79F3zafitDsXSp+P+xqyA/C4GiosU3+I7hN+oq9boqXGj+I88IP8ASEKNIE8W8/RKBpPb1JNQeV1zjEd6mVHNBm56+pR1G28/RShsE8hKjdoeXqgYlwjo1U7NZ7VBhm68o8UURr1K0+En6NpqTxTWFOKjf9Dz4MMDeupm65wSMN0i9GM5hm/wMP1D9LFY4ytkDXRMZjHHVAYX/wBPDDkP0sU+32FzHBsBxbAJ0GYwT3EqyXYhksZ7TVnPcWENnWB6lUeIxDnHpOLusyr87OYxhaLmLuOp+CzlVkOIV5cvwnc1K7EDlxJTYXEpyYocisBj30nh7HFpHDyI3hBhKg0ZPD0nYe2G4i5gPFRjiPyZCRykdko/DN6A/wC56rC+x1fLiWN3Pt2jpDy8VvMP7v5/VQtYy0vUX2FHQb1u/UUE/wD6ju/TM+isKNmN7T3lVsf6nXf/AGIv8Mv0tE9qYnU0RRmM9x3V5lUgAi/FXWNPQPZ5hUz2WF49efzwS16GfB+F90dZ/UUPUuQOQHeT+ynw/uDqPkSn7Pp567G/fb/SAT5FNK7M3hvKLMrWjgAO4Qk3qVRnVdCOaiCuOkz8XmHIoIXE/V/EPOEWFmLPrKH2qoyxj/sug9Th8Q1Z1rZZUbyJHdPmFtNqYfPSe3iDHWLjyWOwbukJ+sIPZ/ye5Tpdl5fRSE9N33mhw7o9FNWu13Nh8DPqmYhmV7eRcz4eRUePxTaVLO7c0tjiSI9FPOym9A2PxLWCk5zgIc7yHxXUPbWjSzgMc/M6ZEAe6Bv6lisQX1XFzpvu4I7AYBn12z1p2pldmlVXhqW/4jNkD6AxvOe/YIU9H2poVnnVk6ZotAuSRYC29UbNnUT9QIt/scx7c1J5aeBuOKm6h9D/AOOp7NA2oCMwMg3HA804HSPkoDZ2EqU2ZXuk8Nw6uIRufT57VJjIe1148eaa51vJcHX3fO9Ne8QgEmweh7OzVFoTBuv3eqMKvHhKvRjNVI5Rg3Svcufk/plJ8GuStCaAnApV6EocG3oYX8Pk2mo9v4mHZByJ9ERhG2wo4NJ8KapNu1W/SvJcBpr1BWwE+g73WKo8XREq1+lJ0E3328PjCBxmFfYudruFh8VpeMa1qKz6O8Jj6RG5GsosHSfmy7yNdY37lNXwuV2QGQRLZ3jr4q32iP8AieaU8LpRtajA0QRCdPSVThZezz4xNI/7jfGy9Mw+n5z5leaezzZxNIffHhf0Xp+FGv43eZUuT0pHheM91v4fUqtb/wBQfn6oVi09Fn4R5lBMwzvpS+bGbQZ0tuQZkHSnMKalprIBHjz0D2eYVVSEjWPnT54q4r0s7ct45R6qJuzG8XfzD0aj8tsH0kisZ7jBxHoB6qw9mKeevm+yHnvMDwKrarsoA+ywn4eS0fshRimXcSB2AT6poXYKeGiTDqnpjtVZEmQYrQdbfMIkIfFjons8wiAs/BZ9YpCxGKo5KrhwdmHU6x8ytus37RYeHNfx6J/Np4z3pWtRRPGZfatOHP8AyvHhPqsv7U1MxpU90uefCPMrZbSbOR32gWn57SsZt+iS+m77jgeWUtme9TXpVdrAMNECyewIatVdMBs21Jt2Eap1Oq8fUafzH/xStM6JaLBshGYNzweg6D1wqh2MI95ob2z6BBjGEkgPiN8xPZw0SfDY7tI3uAxLw9rXgFpMGQDqdR4LR/5Vn2W/yt+C80wm2nNbJMkd9x83XoGxNpGvRZUy5SZBHMGPHXtWmWvSXJnTQaKDeA/lb8FxpDgO4fBOzHkkLzxHd+6YkB4wRl6z6KMqXGE2niVCdOxNIGMSrgN6QGFzcn9MtPgrQlLV2bkuzWSIJU02x9BeIpvM8IDLrF7Swv0dQy573GZeTLgWS1wvxcJHIhbd7cuTlSqeg9FlNp0ZrtcN7Wlx4ua3KZPVk7QulPoRJtkOGBjTrKkc2dU9pXEqX6dOdAmMptFNxMaGOdlCaWejTmzgbHePkBGV2hwAIkb96VwzEHQDQeqKrEH50gq4eRzjvsqbEUL2C0mVDV8KHGdEZ5MZO+L6KjYj8mIpEj67R/McvqvUsPbP+N36isNhdmsztJJsQZ6iCty10Zz993mSmqlXhH4c+lwHtDWXHuNS5x8gqNkwOpK9waJc4NbvJMATzKZkx4d8wU5jo3IbAvzU2OmZa0zrNr333RDBzWRmSCpyPh8VMKvBp/p+KhaxTZOZVpRKjMY0mHc8jB12P9y3WxKGSiwcp79PCFg8meoxo+vUc7sBhviWL0ljIAHAAdy0+Br0eo3aqRRv1CdCUR4n3SpGGw6lHiPdPUVJT0Cz8FXo9AbUw+dhHG3buPeAj0x7ZBCAzMHihNM8WuB8b/qPcs7tmmOiTpm/UJ/td3LY7SoQ94izwT6O8ZKxftCHCmxwHu1BPYHCD3lSpd4X468Zn2M6TxG8keCmYITqjGxnbuvPxUbXyVOtO1YT/RhwuFX1KLQXBzgL6EXMgaeXYjc5CiLi8zNxpvWltAqUxtPZJewvMteDma212gRlPOL+C3WytnPYaBFXW7g1vvsyOMOJJnpll9023zim1q7TmkEC/COzetvsnHQxkAklupIAAkmAMth87gj9P9JckpLo0OVI5gVU7ab4By/1af0pHbQf4cTruCH0iPywvEtFusqMiyFoYp75zbuv1KJabJ58BXTGu1ShMcdOr1Ujepc/J/TKx/JyRwXEpCkQxVY98N/+tn9b4PkVkcXUrZodRc0b3EWg6kdu9a3abTHWKbe5z3IPatPOK0uLRTptEiNY+kI7cwCus/RVTXhm88b07MgMxAB15qdlWyVyWVBLXKRjrIZr1Ix6RoeWTppTS9LTl05RMa/DwhBIZtL0RtSCtTgsUH098wSSQQDY6HeqN2FylpawvJN7WAgwWzaZy81c4JxNyLwbb94i+/TvVZnDlu1XSLPHbRLH5Q2bAz1jrWV27tV1V+vQZYDQTvMT1CeSI9o9qBteACQ1rQTMGQOB1HNZoVZm9ySe9Cm30jmqsRtPZDH5qIpue3MxzmBls2UEFp4mzt3AK/fUIa4h0QCZtuk7xyXlNSqGQcozcfJTYTajmE5XFsgg5d4NiiqYPs2GJ9qjTJzOkiZylto/KisHtitUpte8EZpIAtaSAYy8F59VOgJmRI/fjqt+8zEiJAMDcSNFbjps3rLX2bwubETqKbGieYEnzYexbhUXsvhsrHPIu8z8+XYr1USxAp6xVG/cpFHUTIWvBlUdE9SXDnohK7RJh/dCz8EXpKuXShMftGlRbmq1GsH3jE9Q1PYgU0rdvYe2b7PT7IyvH8t+xebe2lc02tbMZqgcR9oAOzdxI8FpNuf4i4YAtpMdVcDYmGsPESZMESNF5dtrar8Q/O+B0Q1rRMNA3X80/wAN42LN5qQdUEgEcEMytBS7PrZmZd4sUlRl1ztY8Z3y9SaCRWkJrsNaQ4jlJjuQzRluCp245o1slerwdNP0fhqdQkNDpDjki8ydFuaVMMGUaNAHWLQqz2f2a57RVDDH1ZgA294TqI39a0bdnVD9kdZ8LTZJXZOmtAQZE8Nea55ggR+6PGzXge8wdrvHo3XHZp/+Ro7z8EuMH0gXBN97u81YNsoW4TJfOHTawiPFTlqvHhK32D1TdK1y6s26RoXNyf0ys+IlAXOakBTpSIYrMWzM9jfvj+lp/wDMKJjCW/eq1HOjlMNHcWdyn95wcNwdHW/K1p/pKu9h7PDqwcR0aTQB+I3+HcuiJ1kqeIwHths//L4l7Ihpa1zbWMtGYj8wcs4x6+gNo7KoVwBWpNqAaZhJE6wdQsrtf2Cw1V38OaBgWYAWH8hNuwhWfHvgi5lOaeV/TIjDkvMAT6dfBP29shuHxL6IeXhgZmdlDZL25oaJO4i6s8NWpNaxrBDX+6Y1O8Em+bXXgp1xlVzLNQmHwYF3GTw3furKi/LmIa0E2cQBJm91BiKJc0tmCeB064Tajgy8kk2AnXkBoNRdZSkTd032EF7WtPSyDc4atvNvEdqIwTi4tADiIHTMS6Ikx268lWHDl5aZG/qFjcD5meCt6DDbpkwLwGiYOsAW4QIQYQja2y6eIa0OzNc0Q14IIE7nAm4nzN1gtoYF9NxY6JGhFw4Tu/eCLrfVK7czTJAFpOhLoAAAOt0m1dmMrMh4yu1D40PPiNymn2auLVv6eZ1a2YRx8F2SDfuRWJwD2Vsj2wZBPCN7hxFlHVOdxDOf7kwqdYc2NPC59nsEys9oeSGs6VgXSZsLCwJ8lbbY21h6TsjC+q4HpQMoHG5Fzpu+CzWB2nULBh8M0h73EF4MucLgZfsiPrbrq82Z7NBrD9K2XF1hJMAcwd5PgFSJycQU+z2PA08rGjkiUgSqgRFDXeAJOkqZBbSnIesIpdi28lktSoACSQABMmwHWsPtX/EWhSa5tBprPFg73afXm1cOrXish7d+1D8RUdRY4iix2SBbO5lnOdxEyANLTvWOL1ZQs7JJvdNftD29xtQFpqBgOopty/1SXeKy2IxRcS4kknUm5PWShg9MJTLF4H0kc9MlMKQlBsyJ8NVLXSFbiuHCY/ZUBKmwtS4buJAPbaVHkhV2dPDyOeizq1G6QZQeGx72PY9hylrjlNjoNYNt6kxwawZQbnVVxqyAIiDPZbVLELNH5be4ei7K9vxOXEs5fSMk/wAzCfI9i2mCxVOqwPpua9vFsGOR3tPI3XhlQix3EfPop8BtCpRfmY9zHfaaY7HDRw65C1cafhNV/s91DeSUtWT9mPbJlaKdaG1dAQOi/qH1XctDu4LTnESYAOhN+z4lQctMomhmIbYdajlLXqTbtTVSfBaIMReE0OsnV9R1H0TQFy8n9MvPiFY/gnSmSFI0pEuwsEwFF2YBt5038gVudn4MU2ZRqbk8SqH2Ww4kn7PujgbT6LUrshYtOa614IUEPfPUPVGlCVnNaS4mABJPAAFWk5+ReHlPt8wf5x+XKTkZmHPKAAZtMR3rPYTFhj4LQ8ESWjVrhBBBOkEDuU22cS7EV6tQCQ9+YAFvuiQJvM5Yt5qWkwMHAXMndc3PzNlKn2dMT/5wOr49rGNe6Mzvda1wM8L7hxO7rso2OY8xnY55EEBwvF8rBwufNUGKYT0y2BMAm0zw4nqU+xY+lZmEQHFul3RbwlDP0L66NFSw7SWOB6LZygG2vlKOY9+YQWAc5J3E9WgQheRmzOGW2UARlAF5siaLj70RwBt3JGEKq0p3Ah2oNgTvA7JPYn4AuaAHZ8wJk5nG0mBBPSbEc1XVaYnMJbM5jLrk74m150Uv+YLWjKTAOmp4xJvB4pFPYzoN2ps2lXZcAmCWkai1y0b90t8rLGUtk1WNcwPyvfU+jJGj6YY55c065T0Z7tVrW4367JOmZkCRFs2l+HfKD27gGV2C8CZpvkjI4jQx9Q6HhruRl94LU6tINlYI4YFrI6UZiRJcRpM7tbc1ZmrVOoYew+jlgNlY5+HqOzB5gOYWEucA4ETaQJEG60Q9qJ/9to6yQfMro+usJ/PZ7cuXLkRRFXbcrinQqPJgMaXT+G6sV57/AIsbXyUG4dp6VU5ncmMIPi7L3FNC2kLfh5FUeTc6nXrOqhJTnlQkroZIUFdKaClQCKkK6U1KE5OzwZHI+qauQfYyJqrsxULmqcDluTKjUi66GffZ2ewSEWITWlPduKJhGvMcwQvWfZLa/wDmKTXOMvYCx86nQtd2iO0FeRuWt/w7xmXEOYTaoy34mdIeGZJa1aNL7PSnnpdi4plQ3TXOUkx2Me2SO30SlgTHYhgI6bd9szeSR1YbiL6XF+riua03TZWX0cUjXX7VE+pE+KjOKa3We7hY8kEn6NpofZh/ScOZHgD6LULzLCbcdQcS1gMmbmdG7sruY19ERU9rcU4EtyCCdAerR0zePNdM3OEait6R6IVlfbHHhlMsHvPAtcQOZGl/JUWC9pcV7z6gLRJdLWWBjKLAEzcTG4lVeJxTqhz1HZszhu+1pHU3uA4ym+1nRNw97AHsDGy6wte/b6c0PhqLqmjehuBPvEbyOG+I3onE0PpHw4wxug+sYAl1vAc1L9GGSGjfFhrJ5n13JGWl/PTKzaOzajy0AtygGb+7J1nLfQW5InB4FlLTpPO+8kxOVo3I5rBOc2MFouYa3gBvMX6+xR16jGzmvkaXxGgbp28kJ3MNWbqI6u0aVNwD3QRBiHHWY0Ec1M+s8ODYzNuS9xmZEyL2vA0iN6wtbFF78zndJxmTeLzHIK/2djGvohrs2ZoDZF5DdL6yRARpYtFnsuKuJyQS0uLjGvK8WueXWnfRRmIMzrcwDO7hqe7cICAY9xaROZu5283i/OD4hGOrDIAS8OgRlDA48ZDhJ393UkVDuWJSqlriWzIAdFhuggwdOjPCDOitsHWbUaQYDiOkBMTcS0/8arJ46i9ste7O0tbfQgEkgECC0+8IPEqTCPZTDAwkOIkwOiTr728GJtpEWNk2ChW1cAxtWm4tOQuax4bmtlIE2+7I0+qjMZgqDHkNotA3B+V55mTIHVqnYuv9JTLhd7RJFrllx1yBHaOKk9o3Nhrm2DoIJkyCDEcAtrwDWnry5VrtuUB9fua8+QQ59pcPEhziCYkMfExOpA3K2onjLklfPntvtj/M4uo8GWNORn4WWt1nM78y9N9r/a1tPC1Cxr2ue3Ix5yCHPETGbMCBJ03Lw5z1bizNJXu4K4pkpSUyU7FOBSymApwQCOlJKSV0rBOK6UiQoBCz8UjgnFIkGIHiCnDROqNlRUXbljCuRGy8UadVjwSMrgSRrG+OyUO5cwoNdGR626vQHvVXO63uv3EBNq4jDR0WF53QHvv22Ch9lsE2rhqb8wFi02vLCWcfug9qPxtIMcAL2nM6CTPCOELzaWPNO5dopn4p5M02ZY3kQe4SUn+aeZLzJEE6w8cjqCOBtcWRzyNXDt0PwPcqbaTpflbImG9rj/wnm3mAcpvS/p1M1MH7QGvMKrxNcsaSXTljWTwgjlYjsHNWIgCBuEDqFlTbfEA8C3yI+Kef5aJtdplu/ZzXGXPceoNCa3ZlNsGHGDMucSP37URQrZgmYfaLmPLeLSQObf8AnwUVv4WAW12AupsGUNJz5ZBloveeEDrTQHEOcd0xwk8EuHpBjCfr1HOcT92Z7z0UU1wDWjQzPWYjwXSp6Iu1NdIrqIIeIkagHceIPA/um0HvLzmaWtExGh3XPMRZTvqtDhMSbdfJCvxUuyzDjYDr+deSynEbktU9zAt9ME33DTdx03/ugtsMc+nkbPSIBO5rQ4TPHq609uKYzK2C6SGnWG8/XhromVsW3OxhBIM7xrNiRwgH50PYi/6ZbZtNrak1GxDZAcOBAsDqdY7VetqSwucAL5QGizSJJbOhjlvBVLXqZq7zP1w0HgQI80dgNkmzy4CCQA2Z6JIIJNt1xCasaNPQcwAOzyZaLwbGRfTr7xyRdMHI57Ac5Fp6XMi/ybKNrBnmbHKTyIteeWXuU1Og8VTbLTiOiWhpGW0gGc2aNAoqcelXSwp8TUc9hHEgneRYNDZ1IHTI6wrPAUxkY0tBeC8Ai5DiX2n8IN/vJ7cM+DanEjWmTG83L7nmpqWChwflb15XMP8AQ4DwTaJ0V1N4Y+OduR3dY5IrESaVM3hs073/APTJaB/KB8lB+0NG4eASN4vvFiO4q42BQNSmaZAFxUE8xB7bjuWXYzWLSzbiXS17nuflu2RGsT7zt8Dcm/SsLcuR8SDGY2IEC4cYABNtLlJ1ADW0bt41TYE+8W/1T1Hu1Uh8Mj7bVmTTYxpaOk4iXH7LW+9po5ZQlWftDjfpapI0HRbusPiST2qpXo8ayUjh5HtNjpSEpspJTiCtTpTGlLKwR0rpTSUqARQuSLmoGDM5IAJsNBwkyfFJ+6aNOxL8Ug4p+CEcYdPNEz5eqEqLIDCHfuomuT2OsFG7VEx6d/hnig6jUpk3Y8PA5PEfqae9XW2AA9ut22IOkHeN4uvP/YHH/RYkC8PY5sDeRDx+k969F2q2MrnXILgOBuC2erXsXn885R2cT2SqxNMhrib5RPuwCeIMybHwVPgKJdUzGei8T2CQVd1GAzaTeT3SfLuVG+o6i5xFwdeUQAefP97JI7L18Dcq/a1DO1smJlveJ/tKbQ2qx+sg7huRJIcDOliORB1VpXeEmLgXc1FtSqGNL98ZG8sxEnukfmUoYWSQI38Wm268t6rrPe1OOLmMLTdrwCBxIJBBIH2UVxOa/wCB/wAiaLTBuLnEkyC4RzAYBHfdFYqqCZBE9JoEi28i2htwQbqZoYcNklzWNGY6yTu6jB7UFhwG5S0XIEmbmQCdRp8E9P5EmfrsOfTmM0SBPHQag9qHexpBLQCTAntv2/AJ9Ov9YHSx3RMa8exNrOBhoAEdEADSJ03cUFWmqcK+tWM6W4yOfPkR2JrcbkcC6BYy4jTKJ7kVUbqeyeq29VGLpjKA7pGYnSZ8kyxi9huD2e0l7jBzF/ZLjJ67NujqdBjHFwJJIgzG+CdOJv2lD0sQGMphzScwEmdJjdvu4KbEP+jBIg8uMaxwNjBQbCPNTK5g+0TbqGveR4o19RouSdYFjJkT6HuVLiHdLPq1rA9g0JzOAAPDpEDqCPwectH0nSn6pDMkboA0S+gLBlt+oBBEwRxTKbGh73guJdq0kQDIM+FuEpA8k7hIiAIA6lHRqNJIDrgXsdL7+zwRCTVqecuad41O8CYPXv7SqnDYs0/edlfH1ZIyzYTv0Vo2qHnI09I6wCIBtqd/NZzGUy55tYWF+FvikXTK13KR/9k=",
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "BERITA KADUA.",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.black12,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).goNamed(
                AppRoutes.newsDetail,
                params: {
                  "id": i.toString(),
                },
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.25,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        "https://pbs.twimg.com/media/FvSF4znagAEcn1k.jpg",
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " Berita Ketiga",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}

class LatestNewsSection extends StatelessWidget {
  const LatestNewsSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 1; i++)
          LatestNewsCard(
            size: size,
            i: i,
          ),
      ],
    );
  }
}
