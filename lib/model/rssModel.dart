// To parse this JSON data, do
//
//     final rss = rssFromJson(jsonString);

import 'dart:convert';

Rss rssFromJson(String str) => Rss.fromJson(json.decode(str));

String rssToJson(Rss data) => json.encode(data.toJson());

class Rss {
    Rss({
        this.category,
        this.updated,
        this.icon,
        this.id,
        this.link,
        this.logo,
        this.subtitle,
        this.title,
        this.entry,
    });

    Category category;
    DateTime updated;
    String icon;
    String id;
    List<LinkElement> link;
    String logo;
    String subtitle;
    Title title;
    List<Entry> entry;

    factory Rss.fromJson(Map<String, dynamic> json) => Rss(
        category: Category.fromJson(json["category"]),
        updated: DateTime.parse(json["updated"]),
        icon: json["icon"],
        id: json["id"],
        link: List<LinkElement>.from(json["link"].map((x) => LinkElement.fromJson(x))),
        logo: json["logo"],
        subtitle: json["subtitle"],
        title: titleValues.map[json["title"]],
        entry: List<Entry>.from(json["entry"].map((x) => Entry.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category": category.toJson(),
        "updated": updated.toIso8601String(),
        "icon": icon,
        "id": id,
        "link": List<dynamic>.from(link.map((x) => x.toJson())),
        "logo": logo,
        "subtitle": subtitle,
        "title": titleValues.reverse[title],
        "entry": List<dynamic>.from(entry.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.term,
        this.label,
    });

    Title term;
    Label label;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        term: titleValues.map[json["@term"]],
        label: labelValues.map[json["@label"]],
    );

    Map<String, dynamic> toJson() => {
        "@term": titleValues.reverse[term],
        "@label": labelValues.reverse[label],
    };
}

enum Label { R_FUNNY }

final labelValues = EnumValues({
    "r/funny": Label.R_FUNNY
});

enum Title { FUNNY }

final titleValues = EnumValues({
    "funny": Title.FUNNY
});

class Entry {
    Entry({
        this.author,
        this.category,
        this.content,
        this.id,
        this.link,
        this.updated,
        this.title,
    });

    Author author;
    Category category;
    String content;
    String id;
    EntryLink link;
    DateTime updated;
    String title;

    factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        author: Author.fromJson(json["author"]),
        category: Category.fromJson(json["category"]),
        content: json["content"],
        id: json["id"],
        link: EntryLink.fromJson(json["link"]),
        updated: DateTime.parse(json["updated"]),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "author": author.toJson(),
        "category": category.toJson(),
        "content": content,
        "id": id,
        "link": link.toJson(),
        "updated": updated.toIso8601String(),
        "title": title,
    };
}

class Author {
    Author({
        this.name,
        this.uri,
    });

    String name;
    String uri;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "uri": uri,
    };
}

class EntryLink {
    EntryLink({
        this.href,
    });

    String href;

    factory EntryLink.fromJson(Map<String, dynamic> json) => EntryLink(
        href: json["@href"],
    );

    Map<String, dynamic> toJson() => {
        "@href": href,
    };
}

class LinkElement {
    LinkElement({
        this.rel,
        this.href,
    });

    String rel;
    String href;

    factory LinkElement.fromJson(Map<String, dynamic> json) => LinkElement(
        rel: json["@rel"],
        href: json["@href"],
    );

    Map<String, dynamic> toJson() => {
        "@rel": rel,
        "@href": href,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
